function [NBModel, time]= getNBModel(trainX, trainY)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});
  trainX = trainX(:,9:21);
  start = tic;
  NBModel = NaiveBayes.fit(trainX, trainY);
  time = toc(start);
end
