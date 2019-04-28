%% AlexNet_NN METHOD
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Telerobotics and Interactive System Laboratory
% System Engineering and Automation Department
% 20/03/2019
% University of Málaga, Spain
% -------------------------------------------------------------------------
% This code has been implemented using the Neural Network Toolbox. 
% The script returns the confusion matrix as a result for the classification
% of the tactile dataset saved in the 'Experiment_IEEE/Images' folder,
% by using the AlexNet-NN approach.
% =========================================================================

% Clear the workspace
clear

%% Load a  Pre-trained CNN
% AlexNet has been trained on the ImageNet dataset previously, which has 
% 1000 object categories and 1.2 million training images
convnet = alexnet;
layersTransfer = convnet.Layers(1:end-3);

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

numClasses = numel(categories(trainingSet.Labels));

%% Pre-process Images For CNN
% AlexNet can only process RGB images that are 227-by-227.

% Set the ImageDatastore ReadFcn
trainingSet.ReadFcn = @(filename)readAndPreprocessImage_227(filename);
validationSet.ReadFcn = @(filename)readAndPreprocessImage_227(filename);
testSet.ReadFcn = @(filename)readAndPreprocessImage_227(filename);


%% Create the layer array
% Create the array by combining the transferred layers with the new layers
layers = [...
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20, 'BiasLearnRateFactor', 20)
    softmaxLayer
    classificationLayer];

%% Create the training  options
options = trainingOptions('sgdm',...
    'MiniBatchSize',5,...
    'MaxEpochs',10,...
    'InitialLearnRate',0.0001);
    
%% Train the network
tic
ANet_NN = trainNetwork(trainingSet,layers,options);
toc;

%% Evaluate the performance of the network
tic
predictedLabels = classify(ANet_NN,testSet);
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
% save('training_AlexNet_NN_ws')
