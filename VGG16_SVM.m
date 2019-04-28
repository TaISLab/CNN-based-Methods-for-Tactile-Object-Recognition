%% VGG16_SVM METHOD
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
% by using the VGG16-SVM approach.
% =========================================================================
convnet = vgg16;
layersTransfer = convnet.Layers(1:end-3);

%% Download Tactile Data (training and test)
images_dir = fullfile('Experiment_IEEE/Images_halfRes');

images = imageDatastore(images_dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames','FileExtensions','.jpg');

tbl = countEachLabel(images);

% Notice that each set now has exactly the same number of images.
countEachLabel(images);

% Split the data in training, valiation and test sets
[trainingSet, testSet] = splitEachLabel(images, 0.8, 'randomize');
[trainingSet, validationSet] = splitEachLabel(trainingSet, 0.8, 'randomize');

%% Pre-process Images For CNN
% VGG16 can only process RGB images that are 224-by-224.

% Set the ImageDatastore ReadFcn
trainingSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);
testSet.ReadFcn = @(filename)readAndPreprocessImage_224(filename);


%% Set the last layer before the SVM
featureLayer = 'fc6';
tic
trainingFeatures = activations(convnet, trainingSet, featureLayer, ...
    'OutputAs', 'rows','MiniBatchSize',64);

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

% Extract test features using the CNN
tic
testFeatures = activations(convnet, testSet, featureLayer, 'OutputAs','rows','MiniBatchSize',64);

% Pass CNN image features to trained classifier
predictedLabels = predict(classifier, testFeatures);

% Get the known labels
testLabels = testSet.Labels;
toc

% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

% Convert confusion matrix into percentage form
confMatrix = bsxfun(@rdivide,confMat,sum(confMat,2));
% Plot_ConfMatrix(confMatrix)

%% Display the mean accuracy
mean(diag(confMatrix))

% save('VGG16_SVM_ws');
