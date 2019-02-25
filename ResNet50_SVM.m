%% AlexNet_SVM METHOD
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Robotics and Mechatronics Research Group
% System Engineering and Automation Department
% 15/08/2018
% University of Málaga, Spain
% -------------------------------------------------------------------------
% This code has been implemented using the Neural Network Toolbox. 
% The script returns the confusion matrix as a result for the classification
% of the tactile dataset saved in the 'Experiment_IEEE/Images' folder,
% by using the AlexNetN-SVM approach.
% =========================================================================

% Clear the workspace
clear

%% Load a  Pre-trained CNN
% AlexNet has been trained on the ImageNet dataset previously, which has 
% 1000 object categories and 1.2 million training images
convnet = resnet50;
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

%% Pre-process Images For CNN
% AlexNet can only process RGB images that are 227-by-227.

% Set the ImageDatastore ReadFcn
trainingSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);
testSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);

%% Set the last layer before the SVM 
featureLayer = 'fc1000';

tic
trainingFeatures = activations(convnet, trainingSet, featureLayer, ...
    'MiniBatchSize', 256, 'OutputAs', 'rows');


%% Train A Multiclass SVM Classifier Using CNN Features

% Get training labels from the trainingSet
trainingLabels = trainingSet.Labels;

% Train multiclass SVM classifier using a fast linear solver, and set
% 'ObservationsIn' to 'columns' to match the arrangement used for training
% features.

classifier = fitcecoc(trainingFeatures, trainingLabels, ...
    'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'rows');
toc

%% Evaluate Classifier
% Repeat the procedure used earlier to extract image features from
% |testSet|. The test features can then be passed to the classifier to
% measure the accuracy of the trained classifier.

tic
% Extract test features using the CNN
testFeatures = activations(convnet, testSet, featureLayer, 'MiniBatchSize',256, 'OutputAs','rows');

% Pass CNN image features to trained classifier
predictedLabels = predict(classifier, testFeatures);

% Get the known labels
testLabels = testSet.Labels;
toc
% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

% Convert confusion matrix into percentage form
confMatrix = bsxfun(@rdivide,confMat,sum(confMat,2));
Plot_ConfMatrix(confMatrix)

%% Display the mean accuracy
mean(diag(confMatrix))

% save('AlexNet_SVM_ws');
