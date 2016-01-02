function [NBCM, time] = getNBConfMat(NBModel, testX, testY, fileClassLabel)
  start = tic;
  numClasses = length(getlevels(fileClassLabel))
  NBCM = zeros(numClasses, numClasses);6
  for j=1:length(testX)
    post = posterior(NBModel, testX{j});
    totLogPost = sum(log(post));
    [maxLogPost, maxIdx] = max(totLogPost);
    cIdx = find(getlevels(fileClassLabel) == testY{j}(1));
    NBCM(cIdx, maxIdx) = NBCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
