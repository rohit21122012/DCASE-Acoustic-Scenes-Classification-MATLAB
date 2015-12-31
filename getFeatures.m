function [allFileId, allFeatures, allClass] = getFeatures( filesPath )
%Matrices are fileId, features, class
  
  tic;
  display(['Extracting Features from Audio Files..']);
  allFileId = [];
  allFeatures = [];
  allClass = [];   
  
  files = dir([filesPath, '*.wav']);
  for i = 1:length(files)
    fileName = files(i).name;
    fileNameParts = regexp(fileName, '[a-z]+', 'match'); %'bus' 'wav'
    className = fileNameParts{1};
    display(['Reading ... FileNo : ', '[', num2str(i), '/', num2str(length(files)), ...
'],  FileName : ', fileName]);
    [audio, sr] = audioread([filesPath fileName]);
    features = stFeatureExtraction(audio, sr, 0.030, 0.015)';
    numFeatures = length(features);

    allFeatures = [allFeatures; features];
    allFileId = [allFileId; repmat(i, numFeatures, 1)];
    allClass = [allClass ;  nominal(repmat(className, numFeatures, 1))];
  end
  toc;
end
