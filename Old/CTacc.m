function a = NBacc( XT, YT) 
   matlabpool 10;
   opt = statset('UseParallel',true);
   f = @(XT,YT,Xt,Yt) confusionmat(Yt, predict(ClassificationTree.fit(XT,YT),Xt));
   cp = cvpartition(YT,'k',10);
   cfMat = crossval(f,XT,YT,'partition', cp, 'options', opt);
   cfMat = reshape(sum(cfMat),2,2)
   a = sum(diag(cfMat)) / sum(sum(cfMat))
   matlabpool close
end
