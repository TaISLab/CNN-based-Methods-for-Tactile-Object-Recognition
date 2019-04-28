%% RESNET_NN METHOD
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
% by using the ResNet-NN approach with 1/16 resolution tactile images.
% =========================================================================

% Clear the workspace
clear

%% Load a  Pre-trained CNN
% ResNet has been trained on the ImageNet dataset previously, which has 
% 1000 object categories and 1.2 million training images
load('pretrain_ResNet.mat');

%% Download Tactile Data (training and test)
images_dir = fullfile('Experiment_IEEE/Images_fourthRes');

images = imageDatastore(images_dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames','FileExtensions','.jpg');

tbl = countEachLabel(images);

% Notice that each set now has exactly the same number of images.
countEachLabel(images);

% Split the data in training, valiation and test sets
[trainingSet, testSet] = splitEachLabel(images, 0.8, 'randomize');
[trainingSet, validationSet] = splitEachLabel(trainingSet, 0.8, 'randomize');

numClasses = numel(categories(trainingSet.Labels));

%% Pre-process Images For CNN
% ResNet can only process RGB images that are 227-by-227.

% Set the ImageDatastore ReadFcn
trainingSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);
validationSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);
testSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);


%% Create the training  options
options = trainingOptions('sgdm',...
    'MiniBatchSize',16,...
    'MaxEpochs',10,...
    'InitialLearnRate',0.001,...
    'ValidationPatience',4,...
    'ExecutionEnvironment','gpu');
    
%% Train the network
tic
ResNet_NN = trainNetwork(trainingSet,pretrain_ResNet,options);
toc;

%% Evaluate the performance of the network
tic
predictedLabels = classify(ResNet_NN,testSet);
testLabels = testSet.Labels;
toc

test_accuracy = sum(predictedLabels==testLabels)/numel(predictedLabels)

% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

% Convert confusion matrix into percentage form
confMatrix = bsxfun(@rdivide,confMat,sum(confMat,2));

% Plot the confusion matrix
% Plot_ConfMatrix(confMatrix);

% Calculate the recognition rate
recognition_rate = mean(diag(confMatrix));


%% Save the workspace
% save('training_ResNet_NN_ws')