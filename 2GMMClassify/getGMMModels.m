function [GMMModels, time]= getGMMModels(trainX, trainY, nmodes)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});
  %trainX = trainX(:,9:21);

  classes = getlevels(trainY);
  numClasses = length(classes);
  GMMModels = cell(numClasses,1);

  options = statset('MaxIter', 1000 , 'Display', 'final');


  start = tic;
  for i=1:numClasses
    ithClasstrainX = trainX(trainY == classes(i),:);
    kmCids = kmeans(ithClasstrainX, nmodes, 'Replicates',5,'Options', options);
    GMMModels{i} = gmdistribution.fit(ithClasstrainX, nmodes, 'Start', kmCids, 'Regularize', 10e-5 ,'Options',options);
  end
  time = toc(start);
end
