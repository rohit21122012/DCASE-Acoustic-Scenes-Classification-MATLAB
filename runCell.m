config

[allFeatures, allClassLabel, fileClassLabel, X, Y, Z] = ...
getFeaturesInCell('../Data/Scene/private_sample/');
save('features.mat');

%matlabpool close
