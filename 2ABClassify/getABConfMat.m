function [ABCM, time] = getABConfMat(ABModel, testX, testY)

 % classes = getlevels(vertcat(testY{:}));
   classes = unique(vertcat(testY{:}));
   numClasses = length(classes);

  start = tic;

  ABCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
    %[~, acc, pdfs] = svmpredict(testY{j}, testX{j}, ABModel, '-b 1');
   [~,pdfs] = predict(ABModel,testX{j});	    
    totLogPost = sum(log(pdfs));
    [maxLogPost, maxIdx] = max(totLogPost);
%    [~,indmaxIdx] = max(pdfs,[],2); 
 %   maxIdx = mode(indmaxIdx);
    cIdx = find(classes == testY{j}(1));
    ABCM(cIdx, maxIdx) = ABCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
