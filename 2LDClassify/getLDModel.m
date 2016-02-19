function [LDModel, time]= getLDModel(trainX, trainY,type)
  trainX = vertcat(trainX{:});
  trainY = vertcat(trainY{:});

%  classes = getlevels(trainY);
  classes = unique(trainY);
  numClasses = length(classes);


  start = tic;
  LDModel = ClassificationDiscriminant.fit(trainX,trainY,'DiscrimType',type);
  %LDModel = svmtrain(trainY, trainX, ['-h 0 -b 1 -c ' num2str(costVal)]);
  time = toc(start);
end
