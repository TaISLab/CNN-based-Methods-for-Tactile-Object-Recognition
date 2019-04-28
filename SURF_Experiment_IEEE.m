%% SURF_SVM METHOD
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Telerobotics and Interactive Systems Lab
% System Engineering and Automation Department
% 20/03/2019
% University of Málaga, Spain
% ------------------------------------------------------------------------- 
% The script returns the confusion matrix as a result for the classification
% of the tactile dataset saved in the 'Experiment_IEEE/Images' folder,
% by using the SURF-SVM approach.
% =========================================================================


%% Download Tactile Data (training and test)
images_dir = fullfile('Experiment_IEEE/Images');

images = imageDatastore(images_dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames','FileExtensions','.jpg');

tbl = countEachLabel(images);

% Notice that each set now has exactly the same number of images.
countEachLabel(images);

% Split the data in training, valiation and test sets
[trainingSet, testSet] = splitEachLabel(images, 0.8, 'randomize');

numClasses = numel(categories(trainingSet.Labels));


%% Returns a bag of visual features
bag = bagOfFeatures(trainingSet,'GridStep',[3 3]);

%% Training a classifier using the training set of images and the bag of 
% features obtained before
categoryClassifier = trainImageCategoryClassifier(trainingSet,bag);

%% Evaluate the classifier using test images and returns the confusion
% matrix

confMatrix = evaluate(categoryClassifier,testSet);
Plot_ConfMatrix(confMatrix)

% Find the average accuracy of the classification.
mean(diag(confMatrix))

img = imread('./Experiment_IEEE/Images/adhesive/adhesive1.jpg');
tic
[labelIdx, score] = predict(categoryClassifier,img);
toc
