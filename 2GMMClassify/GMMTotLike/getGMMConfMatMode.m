function [GMMCM, time] = getGMMConfMat(GMMModels, testX, testY)

  classes = getlevels(vertcat(testY{:}));
  numClasses = length(classes);

  start = tic;

  GMMCM = zeros(numClasses, numClasses);
  for j=1:length(testX)
  %  testX{j} = testX{j}(:,9:21);
    pdfs = [];
    for c = 1:numClasses
      pdfs = [pdfs, pdf(GMMModels{c}, testX{j})];
    end
    %totLogPost = sum(log(pdfs));
    %[maxLogPost, maxIdx] = max(totLogPost);
    indmaxIdx = max(pdfs,[],2); 
    maxIdx = mode(indmaxIdx);
    cIdx = find(classes == testY{j}(1));
    GMMCM(cIdx, maxIdx) = GMMCM(cIdx, maxIdx) + 1;
  end
  time = toc(start);
end
