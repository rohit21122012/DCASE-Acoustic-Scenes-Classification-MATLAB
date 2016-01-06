matlabpool open 10



config

[allFeatures, allClassLabel, fileClassLabel, X, Y, Z] = ...
getFeaturesInCell('../Data/Scene/scenes_stereo_test/');
save('New/features.mat');


%load features

cvParts = cvpartition(fileClassLabel, 'kFold', 5);

save('New/partitions.mat');

%}

%load partitions

numClasses = length(getlevels(fileClassLabel));
%NBCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
GMMCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
runTime = zeros(2,cvParts.NumTestSets);

parfor i=1:cvParts.NumTestSets
  [trainX, trainY, testX, testY] = ...
              getPartitions(allFeatures, allClassLabel, cvParts, i);
  display(['Training GMM for ' num2str(i) ' th fold validation']);
  %[NBModel, trainTime] = getNBModel(trainX, trainY);
  [GMMModels, trainTime] = getGMMModels(trainX, trainY);
  display(['Testing GMM for ' num2str(i) ' th fold validation']);
  %[NBCM(:,:,i), testTime] = getNBConfMat(NBModel, testX, testY);
  [GMMCM(:,:,i), testTime] = getGMMConfMat(GMMModels, testX, testY);
  runTime(:,i) = [trainTime;testTime];
end

matlabpool close

save('New/GMM.mat');

