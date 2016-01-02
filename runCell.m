config

[allFeatures, allClassLabel, fileClassLabel, X, Y, Z] = ...
getFeaturesInCell('../Data/Scene/scenes_stereo_test/');
save('features.mat');

%matlabpool close
