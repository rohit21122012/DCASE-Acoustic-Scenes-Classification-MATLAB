function [accuracy, sumCM, runTime] = ABClassify(numLearns)
	
	format long;
	format compact;	
        
	load partitions;
	

	numClasses = length(getlevels(fileClassLabel));
	ABCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	allClassLabelDouble = mat2cell(Y,repmat(1997,1,100));


	ABModel = cell(cvParts.NumTestSets,1);
	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabelDouble, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[ABModel{i}, trainTime] = getABModel(trainX, trainY,numLearns); %high cost makes stricter classification over wider margin
		save(['AB' num2str(numLearns)]);
		display(['Testing model for ' num2str(i) ' th fold validation']);
		[ABCM(:,:,i), testTime] = getABConfMat(ABModel{i}, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(ABCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)        
end
