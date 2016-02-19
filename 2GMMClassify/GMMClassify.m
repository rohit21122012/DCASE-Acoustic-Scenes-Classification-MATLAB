function [sumCM, accuracy, runTime] = GMMClassify(nModes);
	
	
        


	
        load partitions;

	numClasses = length(getlevels(fileClassLabel));
	GMMCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabel, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[GMMModels, trainTime] = getGMMModels(trainX, trainY,nModes);

		display(['Testing model for ' num2str(i) ' th fold validation']);
		[GMMCM(:,:,i), testTime] = getGMMConfMatMode(GMMModels, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(GMMCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)
      
        
end
