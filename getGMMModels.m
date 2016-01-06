function [GMMModels, time]= getGMMModels(trainX, trainY)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});
  %trainX = trainX(:,9:21);

  classes = getlevels(trainY);
  numClasses = length(classes);
  GMMModels = cell(numClasses,1);
  options = statset('MaxIter', 1000 );
  start = tic;

  for i=1:numClasses
    ithClasstrainX = trainX(trainY == classes(i),:);
    GMMModels{i} = gmdistribution.fit(ithClasstrainX,8, 'SharedCov', false, 'Options',options);
  end
  time = toc(start);
end
