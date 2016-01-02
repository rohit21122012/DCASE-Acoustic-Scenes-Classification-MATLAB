function [NBCM, time] = getNBConfMat(NBModel, testX, testY)
  start = tic;
  numClasses = NBModel.NClasses;
  NBCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
    testX{j} = testX{j}(:,9:21);
    post = posterior(NBModel, testX{j});
    totLogPost = sum(log(post));
    [maxLogPost, maxIdx] = max(totLogPost);
    cIdx = find(NBModel.ClassLevels == testY{j}(1));
    NBCM(cIdx, maxIdx) = NBCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
