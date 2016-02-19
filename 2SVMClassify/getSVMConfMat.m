function [SVMCM, time] = getSVMConfMat(SVMModel, testX, testY)

 % classes = getlevels(vertcat(testY{:}));
   classes = unique(vertcat(testY{:}));
   numClasses = length(classes);

  start = tic;

  SVMCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
    [~, acc, pdfs] = svmpredict(testY{j}, testX{j}, SVMModel, '-b 1');
    totLogPost = sum(log(pdfs));
    [maxLogPost, maxIdx] = max(totLogPost);
    %[~,indmaxIdx] = max(pdfs,[],2); 
    %maxIdx = mode(indmaxIdx);
    cIdx = find(classes == testY{j}(1));
    SVMCM(cIdx, maxIdx) = SVMCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
