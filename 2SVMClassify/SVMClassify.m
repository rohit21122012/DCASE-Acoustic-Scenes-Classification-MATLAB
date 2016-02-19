function [accuracy, sumCM, runTime] = SVMClassify(costVal)
	
	format long;
	format compact;	
        
	cd libsvm
	addpath ..
	load partitions;
	

	numClasses = length(getlevels(fileClassLabel));
	SVMCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	allClassLabelDouble = mat2cell(Y,repmat(1997,1,100));


	SVMModel = cell(cvParts.NumTestSets,1);
	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabelDouble, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[SVMModel{i}, trainTime] = getSVMModel(trainX, trainY,costVal); %high cost makes stricter classification over wider margin
		save(['SVM' num2str(costVal)]);
		display(['Testing model for ' num2str(i) ' th fold validation']);
		[SVMCM(:,:,i), testTime] = getSVMConfMat(SVMModel{i}, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(SVMCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)        
end
