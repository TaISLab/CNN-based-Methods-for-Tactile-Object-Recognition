%% TactResNet-6
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Robotics and Mechatronics Research Group
% System Engineering and Automation Department
% University of Málaga, Spain
% 15/08/2018
% -------------------------------------------------------------------------
% To run this code the Neural Network Toolbox is needed. 
% =========================================================================

clear
%% TactNet-4 Network Architecture
load('tactResNet6.mat');

%% Download Tactile Data (training and test)
images_dir = fullfile('Experiment_IEEE/Images');

images = imageDatastore(images_dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames','FileExtensions','.jpg');

tbl = countEachLabel(images);

% Notice that each set now has exactly the same number of images.
countEachLabel(images);

% Split the data in training, valiation and test sets
[trainingSet, testSet] = splitEachLabel(images, 0.8, 'randomize');
[trainingSet, validationSet] = splitEachLabel(trainingSet, 0.8, 'randomize');

%% Data Augmentation
dataAugmenter = imageDataAugmenter( ...
    'RandXReflection',1,...
    'RandYReflection',1,...
    'RandXTranslation',[-3 3], ...
    'RandYTranslation',[-3 3],...
    'RandRotation',[-10,10]);

augmented_trainingSet = augmentedImageSource([28 50], trainingSet,...
    'DataAugmentation', dataAugmenter);
augmented_validationSet = augmentedImageSource([28 50], validationSet,...
    'DataAugmentation', dataAugmenter);
augmented_testSet = augmentedImageSource([28 50], testSet,...
    'DataAugmentation', dataAugmenter);

%% Training options
options = trainingOptions('sgdm', ...
    'MaxEpochs',5000, ...
    'Momentum',0.8,...
    'InitialLearnRate', 0.002, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 1, ...
    'LearnRateDropPeriod', 120, ...
    'MiniBatchSize', 4096,...
    'ValidationData',validationSet, ...
    'ValidationFrequency',10, ...
    'VerboseFrequency',1, ...
    'ValidationPatience',5,...
    'Verbose',1,...
    'Plots','training-progress');

%% Training the Network
tic;
tactResNet_trained = trainNetwork(augmented_trainingSet,tactResNet,options);
training_time = toc;

%% Evaluate the performance of the network
tic
predictedLabels = classify(tactResNet_trained,testSet);
testLabels = testSet.Labels;
toc

test_accuracy = sum(predictedLabels==testLabels)/numel(predictedLabels)

% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

% Convert confusion matrix into percentage form
confMatrix = bsxfun(@rdivide,confMat,sum(confMat,2));

% Plot the confusion matrix
Plot_ConfMatrix(confMatrix);

% Calculate the recognition rate
recognition_rate = mean(diag(confMatrix));

%% Save the workspace
save('training_TactResNet6_ws')
