function [allFileId, allFeature, allClass] = getFeatures( filesPath )
%Matrices are fileId, feature, class
  tic;
  files = dir([filesPath, '*wav']);
  for i = 1:length(files)
    fileName = files(i).name;
    className = regexp(, 'a-z+', 'match'); %'bus' 'wav'
    className = className{1};

    [audio, sr] = audioread([filesPath fileName]);
    features = stFeatureExtraction(audio, sr, 0.030, 0.015)';
    numFeatures = length(features);

    allFeature = [allFeature; features];
    allFileId = [allFileId; repmat(i, numFeatures, 1)];
    allClass = [allClass ;  nominal(repmat(className, numFeatures, 1))];
  end
  toc;
  save('features.mat');
end
