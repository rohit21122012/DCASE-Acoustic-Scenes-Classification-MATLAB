function [CTModel, time]= getCTModel(trainX, trainY, costVal)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});

%  classes = getlevels(trainY);
  classes = unique(trainY);
  numClasses = length(classes);


  start = tic;
  CTModel = ClassificationTree.fit(trainX,trainY,'minLeaf',costVal);
  %CTModel = svmtrain(trainY, trainX, ['-h 0 -b 1 -c ' num2str(costVal)]);
  time = toc(start);
end
