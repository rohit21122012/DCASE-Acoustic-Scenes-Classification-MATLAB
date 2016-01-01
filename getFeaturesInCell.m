function [allFeatures, allClassLabel, X, Y, Z] = getFeatures( filesPath )

  tic;
  display(['Extracting Features from Audio Files..']);

  allFeatures = cell(length(files),1);
  fileId = cell(length(files),1);

  allClassLabel = nominal(repmat('',length(files),1));
  frameLabel = cell(length(files),1);

  files = dir([filesPath, '*.wav']);
  parfor i = 1:length(files)
    fileName = files(i).name;      % bus_01.wav
    fileNameParts = regexp(fileName, '[a-z]+', 'match'); %'bus' 'wav'
    className = fileNameParts{1};
    display(['Reading ... FileNo : ', '[', num2str(i), '/', num2str(length(files)), ...
  '],  FileName : ', fileName]);
    [audio, sr] = audioread([dirPath fileName]);
    features = stFeatureExtraction(audio, sr, 0.030, 0.015)';

    allFeatures{i} = features;
    allClassLabel(i) = className;
    fileId{i} = repmat(i,length(features),1);
    frameLabel{i} = nominal(repmat(className,length(features),1));
  end
  toc;

  B = vertcat(fileId{:});
  X = vertcat(allFeatures{:});
  Y = vertcat(frameLabel{:});
  Y = double(Y);
  Z =  [B X Y];
  Z = [1:15; Z];

  csvwrite('midata.csv',Z);
end
%{

save('privdata.mat');
part = cvpartition(allClassLabel, 'kFold', 5);

nClasses = length(getlabels(allClassLabel));

for i=1:part.NumTestSets

  X = allFeatures(training(part,i));
  Y = frameLabel(training(part,i));
  X = vertcat(X{:});
  Y = vertcat(Y{:});
  tic;
  display(['Training Naive Bayes for ' num2str(i) ' th fold validation']);
  NBModel = NaiveBayes.fit(X, Y);
  toc;


  tic;
  display(['Training cSVM for ' num2str(i) ' th fold validation']);
  SVMModel = svmtrain(double(Y), X, '-s 0 -b 1 -q'); %f for posteriors and s for cSVM
  toc;

  testX = allFeatures(test(part,i));
  testY = frameLabel(test(part,i));

  NBCM = zeros(nClasses, nClasses);
  tic;
  display(['Testing Naive Bayes for ' num2str(i) ' th fold validation']);
  for j=1:length(testX)
    post = posterior(NBModel, testX{j});
    totLogPost = sum(log(post));
    [maxLogPost, maxIdx] = max(totLogPost);
    cIdx = find(getlevels(allClassLabel) == testY{j}(1));
    NBCM(cIdx, maxIdx) = NBCM(cIdx, maxIdx) + 1;
  end
  toc;



  display('Naive Bayes Stats');
  NBCM
  correct = sum(diag(NBCM))
  incorrect = length(testX) - correct
  accuracy = correct/length(testX)


  SVMCM = zeros(nClasses, nClasses);

  tic;
  display(['Testing cSVM for ' num2str(i) ' th fold validation']);
  for j=1:length(testX)
    [lab,acc,post] = svmpredict(testX{j}, testY{j}, SVMModel, '-b 1 -q');
    totLogPost = sum(log(post));
    [maxLogPost, maxIdx] = max(totLogPost);
    cIdx = find(getlevels(allClassLabel) == testY{j}(1));
    SVMCM(cIdx, maxIdx) = SVMCM(cIdx, maxIdx) + 1;
  end
  toc;

  display('cSVM Stats');
  SVMCM
  correct = sum(diag(NBCM))
  incorrect = length(testX) - correct
  accuracy = correct/length(testX)

  display('Plotting NB');
  clear fig;
  fig = figure('Visible','off');
  gscatter(X(:,1), X(:,2), Y);
  hax = get(fig, 'children');
  xlims = get(hax(2),'xlim');
  ylims = get(hax(2),'ylim');
  xylim = [xlims ylims];
  hold on;
  Params = cell2mat(NBModel.Params);
  %nClasses = length(getlevels(allClassLabel));
  Mu = Params(2*(1:nClasses)-1,1:2);
  Sigma = zeros(2,2,nClasses);
  for j=1:nClasses
      Sigma(:,:,j) = diag(Params(2*j,1:2));
      ezcontour(@(x1, x2)mvnpdf([x1, x2], Mu(j,:), Sigma(:,:,j)), ...
              xylim+0.5*[-1,1,-1,1])
  end
  title('Naive Bayes Classifier');
  xlabel('MFCC 1');
  ylabel('MFCC 2');
  saveas(fig, ['t_ts' num2str(i) '.png']);
  hold off;
  save('nb.mat');

end
%}
