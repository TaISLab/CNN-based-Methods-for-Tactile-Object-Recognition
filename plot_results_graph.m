clear
close all

%% SVM 10 classes
mean_rigid_SVM10 = [89.21 84.47 86.00 87.50];
mean_semi_SVM10 = [94.33 92.69 96.10 95.40];
mean_flex_SVM10 = [92.33 88.58 95.00 91.42];

std_rigid_SVM10 = [2.64 3.01 2.42 3.06];
std_semi_SVM10 = [2.98 2.52 1.22 1.07];
std_flex_SVM10 = [2.10 2.77 2.13 2.03];

training_time_20_SVM10 = (0.0367+0.0373+0.038)/3;
training_time_30_SVM10 = (0.0456+0.0452+0.0458)/3;
training_time_40_SVM10 = (0.0524+0.0486+0.0632)/3;
training_time_50_SVM10 = (0.0553+0.0526+0.0549)/3;

%% DCNN 10 classes
mean_rigid_DCNN10 = [92.25 88.69 90.73 92.50];
mean_semi_DCNN10 = [95.67 94.67 96.81 96.60];
mean_flex_DCNN10 = [94.12 90.33 92.44 93.38];

std_rigid_DCNN10 = [3.25 3.08 2.75 2.06];
std_semi_DCNN10 = [4.62 2.35 1.47 1.68];
std_flex_DCNN10 = [2.01 2.57 2.65 3.17];

training_time_20_DCNN10 = (4.3953+4.4472+4.3747)/3;
training_time_30_DCNN10 = (6.6187+6.5173+6.5117)/3;
training_time_40_DCNN10 = (8.9923+8.7988+8.8443)/3;
training_time_50_DCNN10 = (10.6040+10.5173+10.4892)/3;

%% SVM 15 classes
mean_rigid_SVM15 = [83 78.43 82.36 85.66];
mean_semi_SVM15 = [93.17 91.54 92.36 95.13];
mean_flex_SVM15 = [88.03 82.80 85.78 88.22];

std_rigid_SVM15 = [2.79 3.18 2.45 1.78];
std_semi_SVM15 = [1.56 1.76 1.48 1.71];
std_flex_SVM15 = [3.29 2.43 1.95 1.54];

training_time_20_SVM15 = (0.0694+0.0683+0.0651)/3;
training_time_30_SVM15 = (0.0706+0.0719+0.0723)/3;
training_time_40_SVM15 = (0.0889+0.0811+0.0853)/3;
training_time_50_SVM15 = (0.0990+0.0918+0.0992)/3;

%% DCNN 15 classes
mean_rigid_DCNN15 = [87.33 86.13 87.63 90.62];
mean_semi_DCNN15 = [95.17 93.87 95.78 95.73];
mean_flex_DCNN15 = [92.67 88.11 91.21 92.13];

std_rigid_DCNN15 = [3.46 3.23 3.47 2.5];
std_semi_DCNN15 = [2.38 1.88 1.58 1.33];
std_flex_DCNN15 = [2.76 3.38 2.29 2.12];

training_time_20_DCNN15 = (6.3659+6.3583+6.3746)/3;
training_time_30_DCNN15 = (9.5006+9.5411+9.6781)/3;
training_time_40_DCNN15 = (12.7467+12.7882+12.5969)/3;
training_time_50_DCNN15 = (15.6506+16.2281+15.9006)/3;

%% Ploting the results

% Recognition-Rate DCNN-SVM 10 classes
figure
subplot(2,2,1)
fig1 = barwitherr([std_rigid_SVM10; std_semi_SVM10; std_flex_SVM10],...
    [mean_rigid_SVM10; mean_semi_SVM10; mean_flex_SVM10], 1);
legend('20 images','30 images','40 images','50 images')
set(gca,'XTickLabel',{'Rigid', 'Semi-rigid', 'Flexible', ' '})
ylabel('Mean Recognition Rate [%]')
ylim([50 100])
xlim([0.3 4.8])
title('DCNN-SVM (10 classes)')
color = summer(4);
set(fig1(1),'facecolor',color(1,:));
set(fig1(2),'facecolor',color(2,:));
set(fig1(3),'facecolor',color(3,:));
set(fig1(4),'facecolor',color(4,:));
grid on
   
% Recognition-Rate DCNN-SVM 15 classes
subplot(2,2,2)
fig2 = barwitherr([std_rigid_SVM15; std_semi_SVM15; std_flex_SVM15],...
    [mean_rigid_SVM15; mean_semi_SVM15; mean_flex_SVM15], 1);
legend('20 images','30 images','40 images','50 images')
set(gca,'XTickLabel',{'Rigid', 'Semi-rigid', 'Flexible', ' '})
ylabel('Mean Recognition Rate [%]')
ylim([50 100])
xlim([0.3 4.8])
title('DCNN-SVM (15 classes)')
color = summer(4);
set(fig2(1),'facecolor',color(1,:));
set(fig2(2),'facecolor',color(2,:));
set(fig2(3),'facecolor',color(3,:));
set(fig2(4),'facecolor',color(4,:));
grid on

% Recognition-Rate DCNN 10 classes
subplot(2,2,3)
fig3 = barwitherr([std_rigid_DCNN10; std_semi_DCNN10; std_flex_DCNN10],...
    [mean_rigid_DCNN10; mean_semi_DCNN10; mean_flex_DCNN10], 1);
legend('20 images','30 images','40 images','50 images')
set(gca,'XTickLabel',{'Rigid', 'Semi-rigid', 'Flexible', ' '})
ylabel('Mean Recognition Rate [%]')
ylim([50 100])
xlim([0.3 4.8])
title('DCNN (10 classes)')
color = summer(4);
set(fig3(1),'facecolor',color(1,:));
set(fig3(2),'facecolor',color(2,:));
set(fig3(3),'facecolor',color(3,:));
set(fig3(4),'facecolor',color(4,:));
grid on

% Recognition-Rate DCNN 15 classes
subplot(2,2,4)
fig4 = barwitherr([std_rigid_DCNN15; std_semi_DCNN15; std_flex_DCNN15],...
    [mean_rigid_DCNN15; mean_semi_DCNN15; mean_flex_DCNN15], 1);
legend('20 images','30 images','40 images','50 images')
set(gca,'XTickLabel',{'Rigid', 'Semi-rigid', 'Flexible', ' '})
ylabel('Mean Recognition Rate [%]')
ylim([50 100])
xlim([0.3 4.8])
title('DCNN (15 classes)')
color = summer(4);
set(fig4(1),'facecolor',color(1,:));
set(fig4(2),'facecolor',color(2,:));
set(fig4(3),'facecolor',color(3,:));
set(fig4(4),'facecolor',color(4,:));
grid on

% Recognition-Rate global 10 classes rigid
figure
errorbar([20 30 40 50],mean_rigid_SVM10,std_rigid_SVM10,'b-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_semi_SVM10,std_semi_SVM10,'r-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_flex_SVM10,std_flex_SVM10,'g-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_rigid_DCNN10,std_rigid_DCNN10,'b:','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_semi_DCNN10,std_semi_DCNN10,'r:','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_flex_DCNN10,std_flex_DCNN10,'g:','LineWidth', 2)
legend('Rigid (DCNN-SVM)','Semi-rigid (DCNN-SVM)','Flexible (DCNN-SVM)',...
    'Rigid (DCNN)','Semi-rigid (DCNN)','Flexible (DCNN)', 'location','southeast')
ylabel('Mean Recognition Rate [%]')
xlabel('Number of images')
title('10 classes experiment')
ylim([50 105])
xlim([15 55])
grid on

% Recognition-Rate global 15 classes rigid
figure
errorbar([20 30 40 50],mean_rigid_SVM15,std_rigid_SVM15,'b-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_semi_SVM15,std_semi_SVM15,'r-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_flex_SVM15,std_flex_SVM15,'g-','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_rigid_DCNN15,std_rigid_DCNN15,'b:','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_semi_DCNN15,std_semi_DCNN15,'r:','LineWidth', 2)
hold on
errorbar([20 30 40 50],mean_flex_DCNN15,std_flex_DCNN15,'g:','LineWidth', 2)
legend('Rigid (DCNN-SVM)','Semi-rigid (DCNN-SVM)','Flexible (DCNN-SVM)',...
    'Rigid (DCNN)','Semi-rigid (DCNN)','Flexible (DCNN)', 'location','southeast')
ylabel('Mean Recognition Rate [%]')
xlabel('Number of images')
title('15 classes experiment')
ylim([50 105])
xlim([15 55])
grid on

% Training time
figure
plot([20 30 40 50], [training_time_20_SVM10,training_time_30_SVM10,...
    training_time_40_SVM10, training_time_50_SVM10],'o-', 'LineWidth', 2);
hold on
plot([20 30 40 50], [training_time_20_SVM15,training_time_30_SVM15,...
    training_time_40_SVM15, training_time_50_SVM15],'^-','LineWidth', 2);
hold on
plot([20 30 40 50], [training_time_20_DCNN10,training_time_30_DCNN10,...
    training_time_40_DCNN10, training_time_50_DCNN10],'s-', 'LineWidth', 2);
hold on
plot([20 30 40 50], [training_time_20_DCNN15,training_time_30_DCNN15,...
    training_time_40_DCNN15, training_time_50_DCNN15],'*-', 'LineWidth', 2);
legend('DCNN-SVM (10 classes)','DCNN-SVM (15 classes)',...
    'DCNN (10 classes)','DCNN (15 classes)', 'location','southeast')
ylabel('Training time [s]')
xlabel('Number of images')
ylim([0 16])
xlim([15 55])
grid on

%% two-levels experiment
mean_rigid_two = 98.78;
mean_semi_two = 97.94;
mean_flex_two = 95.92;

std_rigid_two = 1.15;
std_semi_two = 1.8;
std_flex_two = 1.67;

y = [mean_rigid_two, mean_semi_two, mean_flex_two];                  %The data.
s = [std_rigid_two std_semi_two std_flex_two];                   %The standard deviation.
fHand = figure;
aHand = axes('parent', fHand);
hold(aHand, 'on')
colors = summer(numel(y));
for i = 1:numel(y)
    bar(i, y(i), 'parent', aHand, 'facecolor', colors(i,:));
end
set(gca, 'XTick', 1:numel(y), 'XTickLabel', {'Rigid', 'Semi-Rigid', 'Flexible'})
errorbar(y,s,'.k', 'LineWidth',1);

ylabel('Mean Recognition Rate [%]')
ylim([50 101])
xlim([0.3 3.7])
% title('First Level')
grid on
