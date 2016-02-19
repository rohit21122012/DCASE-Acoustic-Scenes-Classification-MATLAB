function Features = getCustomFeatures(signal, fs, win, step)

% function Features = stFeatureExtraction(signal, fs, win, step)
%
% This function computes basic audio feature sequencies for an audio
% signal, on a short-term basis.
%
% ARGUMENTS:
%  - signal:    the audio signal
%  - fs:        the sampling frequency
%  - win:       short-term window size (in seconds)
%  - step:      short-term step (in seconds)
%
% RETURNS:
%  - Features: a [MxN] matrix, where M is the number of features and N is
%  the total number of short-term windows. Each line of the matrix
%  corresponds to a seperate feature sequence
%
% (c) 2014 T. Giannakopoulos, A. Pikrakis

% if STEREO ...
if (size(signal,2)>1)
    signal = (sum(signal,2)/2); % convert to MONO
end

% convert window length and step from seconds to samples:
windowLength = round(win * fs);
step = round(step * fs);

curPos = 1;
L = length(signal);

% compute the total number of frames:
numOfFrames = floor((L-windowLength)/step) + 1;
% number of features to be computed:
numOfFeatures = 41;
Features = zeros(numOfFeatures, numOfFrames);
Ham = window(@hamming, windowLength);
mfccParams = feature_mfccs_init(windowLength, fs);

for i=1:numOfFrames % for each frame
    % get current frame:
    frame  = signal(curPos:curPos+windowLength-1);
    frame  = frame .* Ham;
    frameFFT = getDFT(frame, fs);

    if (sum(abs(frame))>eps)
        % compute time-domain features:
        Features(1,i) = feature_zcr(frame);
        Features(2,i) = log(feature_energy(frame));

        % compute freq-domain features:
        if (i==1) frameFFTPrev = frameFFT; end;
        MFCCs = feature_mfccs(frameFFT, mfccParams);
        Features(3:15,i) = MFCCs;
     %   Features(16:30,i) = log(deltas(Features(1:15,i),2));
     %   Features(31:45,i) = log(deltas(Features(16:30,i),2));
    else
        Features(:,i) = zeros(numOfFeatures, 1);
    end
    curPos = curPos + step;
    frameFFTPrev = frameFFT;
end
Features(16:28,:) = deltas(Features(3:15,:));
Features(29:41,:) = deltas(Features(16:28,:));
