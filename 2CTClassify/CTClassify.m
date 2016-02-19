function [accuracy, sumCM, runTime] = CTClassify(costVal)
	
	format long;
	format compact;	
        
	load partitions;
	

	numClasses = length(getlevels(fileClassLabel));
	CTCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	allClassLabelDouble = mat2cell(Y,repmat(1997,1,100));


	CTModel = cell(cvParts.NumTestSets,1);
	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabelDouble, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[CTModel{i}, trainTime] = getCTModel(trainX, trainY,costVal); %high cost makes stricter classification over wider margin
		save(['CT' num2str(costVal)]);
		display(['Testing model for ' num2str(i) ' th fold validation']);
		[CTCM(:,:,i), testTime] = getCTConfMat(CTModel{i}, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(CTCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)        
end
