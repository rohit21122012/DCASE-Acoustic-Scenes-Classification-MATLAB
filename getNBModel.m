function [NBModel, time]= getNBModel(trainX, trainY)
  start = tic;
  NBModel = NaiveBayes.fit(X, Y);
  time = toc(start);
end
