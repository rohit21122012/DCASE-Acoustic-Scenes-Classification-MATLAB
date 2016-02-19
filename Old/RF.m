function cf =  RF(XT,YT, Xt, Yt)
  % opts = statset('UseParallel' ,true);
  % matlabpool 10
   tb = TreeBagger(100,XT,YT);	
   cf = confusionmat(Yt, double(nominal(predict(tb, Xt)))-1)
end
