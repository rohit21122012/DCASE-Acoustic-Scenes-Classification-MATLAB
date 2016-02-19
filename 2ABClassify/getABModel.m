function [ABModel, time]= getABModel(trainX, trainY, numLearns)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});

%  classes = getlevels(trainY);
  classes = unique(trainY);
  numClasses = length(classes);


  start = tic;
  
  ABModel = fitensemble(trainX,trainY,'AdaBoostM2', numLearns,{ClassificationTree.template, ClassificationDiscriminant.template});
  %ABModel = svmtrain(trainY, trainX, ['-h 0 -b 1 -c ' num2str(costVal)]);
  time = toc(start);
end
