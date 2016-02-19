function [CTCM, time] = getCTConfMat(CTModel, testX, testY)

 % classes = getlevels(vertcat(testY{:}));
   classes = unique(vertcat(testY{:}));
   numClasses = length(classes);

  start = tic;

  CTCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
    %[~, acc, pdfs] = svmpredict(testY{j}, testX{j}, CTModel, '-b 1');
    [~,pdfs] = predict(CTModel,testX{j});	    
    totLogPost = sum(log(pdfs));
    [maxLogPost, maxIdx] = max(totLogPost);
  %  [~,indmaxIdx] = max(pdfs,[],2); 
   % maxIdx = mode(indmaxIdx);
    cIdx = find(classes == testY{j}(1));
    CTCM(cIdx, maxIdx) = CTCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
