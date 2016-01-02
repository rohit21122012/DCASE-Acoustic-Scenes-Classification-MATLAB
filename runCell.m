%{config

[allFeatures, allClassLabel, fileClassLabel, X, Y, Z] = ...
getFeaturesInCell('../Data/Scene/scenes_stereo_test/');
save('features.mat');
%}

load features

cvParts = cvpartition(fileClassLabel, 'kFold', 5);

save('partitions.mat');

nClasses = length(getlabels(fileClassLabel));
NBCM = zeros(numClasses, numClasses, cvParts.NumTestSets)
runTime = zeros(2,cvParts.NumTestSets);
parfor i=1:cvParts.NumTestSets
  [trainX, trainY, testX, testY] = ...
              getPartitions(allFeatures, allClassLabel, cvParts, i);
  display(['Training Naive Bayes for ' num2str(i) ' th fold validation']);
  [NBModel, runTime(1,i)] = getNBModel(trainX, trainY);
  display(['Testing Naive Bayes for ' num2str(i) ' th fold validation']);
  [NBCM(:,:,i), runTime(2,i)] = getNBConfMat(NBModel, testX, testY, fileClassLabel);
end
save('NB.mat');
