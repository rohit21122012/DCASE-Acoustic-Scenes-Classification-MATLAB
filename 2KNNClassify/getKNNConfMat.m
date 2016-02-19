function [KNNCM, time] = getKNNConfMat(KNNModel, testX, testY)

 % classes = getlevels(vertcat(testY{:}));
   classes = unique(vertcat(testY{:}));
   numClasses = length(classes);

  start = tic;

  KNNCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
    %[~, acc, pdfs] = svmpredict(testY{j}, testX{j}, KNNModel, '-b 1');
    [~,pdfs] = predict(KNNModel,testX{j});	    
%    totLogPost = sum(log(pdfs));
 %   [maxLogPost, maxIdx] = max(totLogPost);
    [~,indmaxIdx] = max(pdfs,[],2); 
    maxIdx = mode(indmaxIdx);
    cIdx = find(classes == testY{j}(1));
    KNNCM(cIdx, maxIdx) = KNNCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
