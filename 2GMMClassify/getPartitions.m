function [trainX, trainY, testX, testY] = ...
                  getPartitions(allFeatures, allClassLabel, cvParts, part)
                  
  trainX = allFeatures(training(cvParts, part));
  trainY = allClassLabel(training(cvParts, part));
  testX = allFeatures(test(cvParts, part));
  testY = allClassLabel(test(cvParts, part));
end
