function [KNNModel, time]= getKNNModel(trainX, trainY, costVal)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});

%  classes = getlevels(trainY);
  classes = unique(trainY);
  numClasses = length(classes);


  start = tic;
  KNNModel = ClassificationKNN.fit(trainX,trainY,'NumNeighbors',costVal);
  %KNNModel = svmtrain(trainY, trainX, ['-h 0 -b 1 -c ' num2str(costVal)]);
  time = toc(start);
end
