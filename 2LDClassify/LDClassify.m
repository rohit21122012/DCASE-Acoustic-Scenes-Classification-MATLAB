function [accuracy, sumCM, runTime] = LDClassify(type)
	
	format long;
	format compact;	
        
	load partitions;
	

	numClasses = length(getlevels(fileClassLabel));
	LDCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	allClassLabelDouble = mat2cell(Y,repmat(1997,1,100));


	LDModel = cell(cvParts.NumTestSets,1);
	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabelDouble, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[LDModel{i}, trainTime] = getLDModel(trainX, trainY,type); %high cost makes stricter classification over wider margin
		display(['Testing model for ' num2str(i) ' th fold validation']);
		[LDCM(:,:,i), testTime] = getLDConfMat(LDModel{i}, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(LDCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)        
end
