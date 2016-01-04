function [GMMModels, time]= getGMMModels(trainX, trainY)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});
  trainX = trainX(:,9:21);

  classes = getlevels(trainY);
  numClasses = length(classes);
  GMMModels = cell(numClasses,1);
  start = tic;

  for i=1:numClasses
    ithClasstrainX = trainX(trainY == classes(i),:);
    GMModels{i} = gmdistribution.fit(ithClasstrainX,4));
  time = toc(start);
end
