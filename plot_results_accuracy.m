%% TactNet
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Robotics and Mechatronics Research Group
% System Engineering and Automation Department
% University of Málaga, Spain
% 15/08/2018
% -------------------------------------------------------------------------
% This scrip plot the results of the mean recognition rates and the 
% classification time of each method 
% =========================================================================

%% Load the results
clear
load('results_all_2')

%% Plot the TactNet results
% Get the mean and errors for each TactNet configuration on the training
% validation and test sets

% TactNet-4
mean_tnet4_train = mean(tnet4_train);
mean_tnet4_val = mean(tnet4_val);
mean_tnet4_test = mean(tnet4_test);
error_upper_tnet4_train = max(tnet4_train) - mean_tnet4_train;
error_lower_tnet4_train = mean_tnet4_train - min(tnet4_train);
error_upper_tnet4_val = max(tnet4_val) - mean_tnet4_val;
error_lower_tnet4_val = mean_tnet4_val - min(tnet4_val);
error_upper_tnet4_test = max(tnet4_test) - mean_tnet4_test;
error_lower_tnet4_test = mean_tnet4_test - min(tnet4_test);
std_tactNet4_train = std(tnet4_train);
std_tactNet4_validation = std(tnet4_val);
std_tactNet4_test = std(tnet4_test);

% TactNet-5
mean_tnet5_train = mean(tnet5_train);
mean_tnet5_val = mean(tnet5_val);
mean_tnet5_test = mean(tnet5_test);
error_upper_tnet5_train = max(tnet5_train) - mean_tnet5_train;
error_lower_tnet5_train = mean_tnet5_train - min(tnet5_train);
error_upper_tnet5_val = max(tnet5_val) - mean_tnet5_val;
error_lower_tnet5_val = mean_tnet5_val - min(tnet5_val);
error_upper_tnet5_test = max(tnet5_test) - mean_tnet5_test;
error_lower_tnet5_test = mean_tnet5_test - min(tnet5_test);
std_tactNet5_train = std(tnet5_train);
std_tactNet5_validation = std(tnet5_val);
std_tactNet5_test = std(tnet5_test);

% TactNet-6
mean_tnet6_train = mean(tnet6_train);
mean_tnet6_val = mean(tnet6_val);
mean_tnet6_test = mean(tnet6_test);
error_upper_tnet6_train = max(tnet6_train) - mean_tnet6_train;
error_lower_tnet6_train = mean_tnet6_train - min(tnet6_train);
error_upper_tnet6_val = max(tnet6_val) - mean_tnet6_val;
error_lower_tnet6_val = mean_tnet6_val - min(tnet6_val);
error_upper_tnet6_test = max(tnet6_test) - mean_tnet6_test;
error_lower_tnet6_test = mean_tnet6_test - min(tnet6_test);
std_tactNet6_train = std(tnet6_train);
std_tactNet6_validation = std(tnet6_val);
std_tactNet6_test = std(tnet6_test);

% Tactresnet6
mean_tresnet6_train = mean(tresnet6_train);
mean_tresnet6_val = mean(tresnet6_val);
mean_tresnet6_test = mean(tresnet6_test);
error_upper_tresnet6_train = max(tresnet6_train) - mean_tresnet6_train;
error_lower_tresnet6_train = mean_tresnet6_train - min(tresnet6_train);
error_upper_tresnet6_val = max(tresnet6_val) - mean_tresnet6_val;
error_lower_tresnet6_val = mean_tresnet6_val - min(tresnet6_val);
error_upper_tresnet6_test = max(tresnet6_test) - mean_tresnet6_test;
error_lower_tresnet6_test = mean_tresnet6_test - min(tresnet6_test);
std_tactresnet6_train = std(tresnet6_train);
std_tactresnet6_validation = std(tresnet6_val);
std_tactresnet6_test = std(tresnet6_test);


% Tactresnet7
mean_tresnet7_train = mean(tresnet7_train);
mean_tresnet7_val = mean(tresnet7_val);
mean_tresnet7_test = mean(tresnet7_test);
error_upper_tresnet7_train = max(tresnet7_train) - mean_tresnet7_train;
error_lower_tresnet7_train = mean_tresnet7_train - min(tresnet7_train);
error_upper_tresnet7_val = max(tresnet7_val) - mean_tresnet7_val;
error_lower_tresnet7_val = mean_tresnet7_val - min(tresnet7_val);
error_upper_tresnet7_test = max(tresnet7_test) - mean_tresnet7_test;
error_lower_tresnet7_test = mean_tresnet7_test - min(tresnet7_test);
std_tactresnet7_train = std(tresnet7_train);
std_tactresnet7_validation = std(tresnet7_val);
std_tactresnet7_test = std(tresnet7_test);


mean_tactNet4 = [mean_tnet4_train mean_tnet4_val mean_tnet4_test];
error_upper_tactNet4 = [error_upper_tnet4_train error_upper_tnet4_val error_upper_tnet4_test];
error_lower_tactNet4 = [error_lower_tnet4_train error_lower_tnet4_val error_lower_tnet4_test];
std_tacNet4 = [std_tactNet4_train std_tactNet4_validation std_tactNet4_test];

mean_tactNet5 = [mean_tnet5_train mean_tnet5_val mean_tnet5_test];
error_upper_tactNet5 = [error_upper_tnet5_train error_upper_tnet5_val error_upper_tnet5_test];
error_lower_tactNet5 = [error_lower_tnet5_train error_lower_tnet5_val error_lower_tnet5_test];
std_tacNet5 = [std_tactNet5_train std_tactNet5_validation std_tactNet5_test];

mean_tactNet6 = [mean_tnet6_train mean_tnet6_val mean_tnet6_test];
error_upper_tactNet6 = [error_upper_tnet6_train error_upper_tnet6_val error_upper_tnet6_test];
error_lower_tactNet6 = [error_lower_tnet6_train error_lower_tnet6_val error_lower_tnet6_test];
std_tacNet6 = [std_tactNet6_train std_tactNet6_validation std_tactNet6_test];

mean_tactresnet6 = [mean_tresnet6_train mean_tresnet6_val mean_tresnet6_test];
error_upper_tactresnet6 = [error_upper_tresnet6_train error_upper_tresnet6_val error_upper_tresnet6_test];
error_lower_tactresnet6 = [error_lower_tresnet6_train error_lower_tresnet6_val error_lower_tresnet6_test];
std_tactresnet6 = [std_tactresnet6_train std_tactresnet6_validation std_tactresnet6_test];


mean_tactresnet7 = [mean_tresnet7_train mean_tresnet7_val mean_tresnet7_test];
error_upper_tactresnet7 = [error_upper_tresnet7_train error_upper_tresnet7_val error_upper_tresnet7_test];
error_lower_tactresnet7 = [error_lower_tresnet7_train error_lower_tresnet7_val error_lower_tresnet7_test];
std_tactresnet7 = [std_tactresnet7_train std_tactresnet7_validation std_tactresnet7_test];

error(:,:,1) = [std_tacNet4;std_tacNet6;std_tactresnet6];
error(:,:,2) = [std_tacNet4;std_tacNet6;std_tactresnet6];

% Plot the recognition-Rate (training, validation and test sets)
figure
fig1 = barwitherr(error,...
    [mean_tactNet4; mean_tactNet6; mean_tactresnet6]);
legend('training', 'validation', 'test')
set(gca,'XTickLabel',{'TactNet-4', 'TactNet-6', 'TactResNet', ' '})
ylabel('Mean Recognition Rate [%]')
ylim([91 100])
xlim([0.3 4.2])
color = summer(3);
set(fig1(1),'facecolor',color(1,:));
set(fig1(2),'facecolor',color(2,:));
set(fig1(3),'facecolor',color(3,:));
grid on

%% Plot all the results together

% SURF-SVM
mean_surf_svm = mean(surf_svm_acc);
error_upper_surf_svm = max(surf_svm_acc) - mean_surf_svm;
error_lower_surf_svm = mean_surf_svm - min(surf_svm_acc);
std_surf_svm = std(surf_svm_acc);

% AlexNet-SVM
mean_anet_svm = mean(anet_svm_acc);
error_upper_anet_svm = max(anet_svm_acc) - mean_anet_svm;
error_lower_anet_svm = mean_anet_svm - min(anet_svm_acc);
std_anet_svm = std(anet_svm_acc);

% AlexNet-NN
mean_anet_nn = mean(anet_nn_acc);
error_upper_anet_nn = max(anet_nn_acc) - mean_anet_nn;
error_lower_anet_nn = mean_anet_nn - min(anet_nn_acc);
std_anet_nn = std(anet_nn_acc);

% VGG16-SVM
mean_vgg_svm = mean(vgg_svm_acc);
error_upper_vgg_svm = max(vgg_svm_acc) - mean_vgg_svm;
error_lower_vgg_svm = mean_vgg_svm - min(vgg_svm_acc);
std_vgg_svm = std(vgg_svm_acc);

% VGG16-NN
mean_vgg_nn = mean(vgg_nn_acc);
error_upper_vgg_nn = max(vgg_nn_acc) - mean_vgg_nn;
error_lower_vgg_nn = mean_vgg_nn - min(vgg_nn_acc);
std_vgg_nn = std(vgg_nn_acc);

% SqueezeNet-SVM
mean_squeeze_svm = mean(squeeze_svm_acc);
error_upper_squeeze_svm = max(squeeze_svm_acc) - mean_squeeze_svm;
error_lower_squeeze_svm = mean_squeeze_svm - min(squeeze_svm_acc);
std_squeeze_svm = std(squeeze_svm_acc);

% SqueezeNet-NN
mean_squeeze_nn = mean(squeeze_nn_acc);
error_upper_squeeze_nn = max(squeeze_nn_acc) - mean_squeeze_nn;
error_lower_squeeze_nn = mean_squeeze_nn - min(squeeze_nn_acc);
std_squeeze_nn = std(squeeze_nn_acc);

% resnet6-SVM
mean_res_svm = mean(res_svm_acc);
error_upper_res_svm = max(res_svm_acc) - mean_res_svm;
error_lower_res_svm = mean_res_svm - min(res_svm_acc);
std_res_svm = std(res_svm_acc);

% resnet6-NN
mean_res_nn = mean(res_nn_acc);
error_upper_res_nn = max(res_nn_acc) - mean_res_nn;
error_lower_res_nn = mean_res_nn - min(res_nn_acc);
std_res_nn = std(res_nn_acc);

clear error
error(:,1) = [std_surf_svm;std_squeeze_svm;std_anet_svm;std_res_svm;...
    std_vgg_svm;std_squeeze_nn; std_anet_nn;std_res_nn; std_vgg_nn; ...
    std_tactNet4_test; std_tactNet6_test; std_tactresnet6_test];
error(:,2) = [std_surf_svm;std_squeeze_svm;std_anet_svm;std_res_svm;...
    std_vgg_svm;std_squeeze_nn; std_anet_nn;std_res_nn; std_vgg_nn; ...
    std_tactNet4_test; std_tactNet6_test; std_tactresnet6_test];

% Plot the recognition-Rate (only test sets)
figure
fig1 = barwitherr(error,...
    [mean_surf_svm;mean_squeeze_svm; mean_anet_svm; mean_res_svm; ...
    mean_vgg_svm; mean_squeeze_nn; mean_anet_nn; mean_res_nn; ...
    mean_vgg_nn; mean_tnet4_test; mean_tnet6_test; mean_tresnet6_test],...
    'BarWidth',0.6);
set(gca,'XTickLabel',{'Surf-SVM','SqueezeNet-SVM','AlexNet-SVM','ResNet-SVM',...
    'VGG16-SVM','SqueezeNet-NN','AlexNet-NN','ResNet-NN','VGG16-NN',...
    'TactNet-4', 'TactNet-6','TactResNet',' ',...
    'Rotation',90})
xtickangle(60)
ylabel('Mean Recognition Rate [%]')
ylim([73 100])
xlim([0.3 12.7])
color = [0.1 0.6 0.4];
set(fig1(1),'facecolor',color);
grid on

%% 
% tN4, tN6, tRN, SN-SVM, SN-NN, AN-SVM, AN-NN, SN-NN, RN-SVM, RN-NN, V-SVM, V-NN
%

N_Parameters = [25 104 709 1700 1700 57000 57000 25600 25600 117000 118000];
time_GPU = [0.051 0.056 0.077 1.05 1.11 0.96 1.06 3.21 3.31 6.15 6.65];

% Plot the recognition-Rate (only test sets)
figure
yyaxis left
fig1 = barwitherr([0,0,0,0,0,0,0,0,0,0,0],N_Parameters,'BarWidth',0.6);
set(gca,'XTickLabel',{'TactNet-4', 'TactNet-6', 'TactResNet',...
    'AlexNet-SVM','SqueezeNet-SVM', 'AlexNet-NN','SqueezeNet-NN',...
    'ResNet-SVM','ResNet-NN','VGG16-SVM','VGG16-NN',' ', 'Rotation',90})
xtickangle(60)
ylabel('Number of parameters')
%ylim([80 101])
xlim([0.3 11.8])
color = [0.2 0.5 0.8];
set(fig1(1),'facecolor',color);
grid on

yyaxis right
plot(1:11,time_GPU, 'r-^');
ylabel('t_{GPU} [s]')

