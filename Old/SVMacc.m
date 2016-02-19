function a = SVMacc( XT, YT) 
   matlabpool 10;
   opt = statset('UseParallel',true,'maxIter', 1000, 'display','iter');
   f = @(XT,YT,Xt,Yt) confusionmat(Yt, predict(svmtrain(XT,YT,'kernel_function','rbf'),Xt));
   cp = cvpartition(YT,'k',10);
   cfMat = crossval(f,XT,YT,'partition', cp, 'options', opt);
   cfMat = reshape(sum(cfMat),2,2)
   a = sum(diag(cfMat)) / sum(sum(cfMat))
   matlabpool close
end
