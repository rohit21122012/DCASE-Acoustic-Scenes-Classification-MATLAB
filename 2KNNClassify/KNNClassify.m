function [accuracy, sumCM, runTime] = KNNClassify(costVal)
	
	format long;
	format compact;	
        
	load partitions;
	

	numClasses = length(getlevels(fileClassLabel));
	KNNCM = zeros(numClasses, numClasses, cvParts.NumTestSets);
	runTime = zeros(2,cvParts.NumTestSets);

	allClassLabelDouble = mat2cell(Y,repmat(1997,1,100));


	KNNModel = cell(cvParts.NumTestSets,1);
	for i=1:cvParts.NumTestSets
		[trainX, trainY, testX, testY] = ...
		          getPartitions(allFeatures, allClassLabelDouble, cvParts, i);
		display(['Training model for ' num2str(i) ' th fold validation']);
		[KNNModel{i}, trainTime] = getKNNModel(trainX, trainY,costVal); %high cost makes stricter classification over wider margin
		save(['KNN' num2str(costVal)]);
		display(['Testing model for ' num2str(i) ' th fold validation']);
		[KNNCM(:,:,i), testTime] = getKNNConfMat(KNNModel{i}, testX, testY);

		runTime(:,i) = [trainTime;testTime];
	end

	sumCM = sum(KNNCM,3)
	accuracy = sum(diag(sumCM))/sum(sum(sumCM))
	sumRT = sum(runTime,2)        
end
