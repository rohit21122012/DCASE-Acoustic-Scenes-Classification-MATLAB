function a = RFacc( XT, YT) 
   matlabpool 10;
   opt = statset('UseParallel',true,'Display','iter');
%   f = @(XT,YT,Xt,Yt) confusionmat(Yt-9, double(nominal(predict(TreeBagger(50,XT,YT),Xt)))-1);
   cp = cvpartition(YT,'k',10);
   cfMat = crossval(@RF,XT,YT-9,'partition', cp, 'options', opt);
   cfMat = reshape(sum(cfMat),2,2)
   a = sum(diag(cfMat)) / sum(sum(cfMat))
   matlabpool close
end
