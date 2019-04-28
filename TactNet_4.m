%% TactNet4
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Telerobotics and Interactive Systems Lab
% System Engineering and Automation Department
% 20/03/2019
% University of Málaga, Spain
% -------------------------------------------------------------------------
% This code has been implemented using the Neural Network Toolbox. 
% The script returns the confusion matrix as a result for the classification
% of the tactile dataset saved in the 'Experiment_IEEE/Images' folder,
% by using the TactNet4 approach.
% =========================================================================

clear
%% TactNet-4 Network Architecture
TactNet = [
    %input
    imageInputLayer([28 50 1], 'Name', 'Input')
    
    %conv1
    convolution2dLayer([5 5],8,'Padding','same','Name','conv1')
    batchNormalizationLayer('Name','batch1')
    reluLayer('Name','ReLU1')
    maxPooling2dLayer(2,'Stride',2,'Padding','same','Name','pool1')
    
    %conv2
    convolution2dLayer([3 3],16,'Padding','same','Name','conv2')
    batchNormalizationLayer('Name','batch2')
    reluLayer('Name','ReLU2')
    maxPooling2dLayer(2,'Stride',2,'Padding','same','Name','pool2')
    
    %conv3
    convolution2dLayer([3 3],32,'Padding','same','Name','conv3')
    batchNormalizationLayer('Name','batch3')
    reluLayer('Name','ReLU3')
    maxPooling2dLayer(2,'Stride',2,'Padding','same','Name','pool3')
    
    %fc1
    fullyConnectedLayer(22,'Name','fc1')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','output')
    ];

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
    'InitialLearnRate', 0.05,...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.1, ...
    'LearnRateDropPeriod', 200, ...
    'MiniBatchSize', 4096,...
    'ValidationData',validationSet, ...
    'ValidationFrequency',10, ...
    'VerboseFrequency',1, ...
    'ValidationPatience',3,...
    'Verbose',1,...
    'Plots','training-progress');

%% Training the Network
tic;
TactNet_trained = trainNetwork(augmented_trainingSet,TactNet,options);
training_time = toc;

%% Evaluate the performance of the network
tic
predictedLabels = classify(TactNet_trained,testSet);
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
save('training_TactNet4_ws')
