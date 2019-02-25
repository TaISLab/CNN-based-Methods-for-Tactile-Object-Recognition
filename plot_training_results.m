%% TACTILENET
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Robotics and Mechatronics Research Group
% System Engineering and Automation Department
% University of Málaga, Spain
% 15/03/2018
% -------------------------------------------------------------------------
% To run this code, the Neural Network Toolbox is needed. 
% =========================================================================


%% TactileNet4
clear
load('training_TactNet4_ws')

% Set the time vector of the learning process
t = trainingtactileNet4(:,1); 

% Get the time-series of the accuracy achieved with the test set
j=1;
test_acc = zeros(1, length(trainingtactileNet4)/25);
t_test = zeros(1, length(trainingtactileNet4)/25);
for i=1:length(trainingtactileNet4(:,3))
    if isnan(trainingtactileNet4(i,3)) == 0
        test_acc(j) = trainingtactileNet4(i,3);
        t_test(j) = t(i);
        j = j+1;
    end
end

% Plot the accuracy of tactilenet6 configuration in training and test sets
figure
plot(t',trainingtactileNet4(:,2),'Color',[1 0.6 0])
hold on
plot(t_test,test_acc,'s-r', 'LineWidth',1.5);
grid
ylim([0 105]);
xlabel('Epochs')
ylabel('Accuracy [%]')

%% TactileNet5
load('training_tactileNet5_ws')

% Set the time vector of the learning process
t = trainingtactileNet5(:,1);

% Get the time-series of the accuracy achieved with the test set
j=1;
test_acc = zeros(1, length(trainingtactileNet5)/25);
t_test = zeros(1, length(trainingtactileNet5)/25);
for i=1:length(trainingtactileNet5(:,3))
    if isnan(trainingtactileNet5(i,3)) == 0
        test_acc(j) = trainingtactileNet5(i,3);
        t_test(j) = t(i);
        j = j+1;
    end
end

% Plot the accuracy of tactilenet5 configuration in training and test sets
figure
plot(t,trainingtactileNet5(:,2),'Color',[1 0.6 0])
hold on
plot(t_test,test_acc,'o-r', 'LineWidth',1.5);
grid
ylim([0 105]);
xlabel('Epochs')
ylabel('Accuracy [%]')

%% TactileNet6
clear
load('training_TactNet6_ws')

% Set the time vector of the learning process
t = trainingtactileNet6(:,1);

% Get the time-series of the accuracy achieved with the test set
j=1;
test_acc = zeros(1, length(trainingtactileNet6)/25);
t_test = zeros(1, length(trainingtactileNet6)/25);
for i=1:length(trainingtactileNet6(:,3))
    if isnan(trainingtactileNet6(i,3)) == 0
        test_acc(j) = trainingtactileNet6(i,3);
        t_test(j) = t(i);
        j = j+1;
    end
end

% Plot the accuracy of tactilenet6 configuration in training and test sets
figure
plot(t,trainingtactileNet6(:,2),'Color',[1 0.6 0]);
hold on;
plot(t_test,test_acc,'s-r', 'LineWidth',1.5);
grid
ylim([0 105]);
xlabel('Epochs')
ylabel('Accuracy [%]')


%% TactResNet6
clear
load('training_TactResNet6_ws')

% Set the time vector of the learning process
t = trainingtactResNet(:,1);

% Get the time-series of the accuracy achieved with the test set
j=1;
test_acc = zeros(1, length(trainingtactResNet)/25);
t_test = zeros(1, length(trainingtactResNet)/25);
for i=1:length(trainingtactResNet(:,3))
    if isnan(trainingtactResNet(i,3)) == 0
        test_acc(j) = trainingtactResNet(i,3);
        t_test(j) = t(i);
        j = j+1;
    end
end

% Plot the accuracy of tactilenet6 configuration in training and test sets
figure
plot(t,trainingtactResNet(:,2),'Color',[1 0.6 0]);
hold on;
plot(t_test,test_acc,'s-r', 'LineWidth',1.5);
grid
ylim([0 105]);
xlabel('Epochs')
ylabel('Accuracy [%]')
%% Results together
clear
load('tactileNets_results_ws')

% Set the time vector of the learning process

epochs4 = trainingtactileNet4(:,1);
time_test4 = 0:epochs4(length(epochs4))/(length(trainingtactileNet4)/10):epochs4(length(epochs4));

epochs6 = trainingtactileNet6(:,1);
time_test6 = 0:epochs6(length(epochs6))/(length(trainingtactileNet6)/10):epochs6(length(epochs6));

epochsRes6 = trainingtactResNet(:,1);
time_testRes6 = 0:epochsRes6(length(epochsRes6))/(length(trainingtactResNet)/10):epochsRes6(length(epochsRes6));


% Get the time-series of the accuracy achieved with the test set
j=1;
test_acc4 = zeros(1, length(trainingtactileNet4)/10);
for i=1:length(trainingtactileNet4(:,3))
    if isnan(trainingtactileNet4(i,3)) == 0
        test_acc4(j) = trainingtactileNet4(i,3);
        j = j+1;
    end
end

j=1;
test_acc6 = zeros(1, length(trainingtactileNet6)/10);
for i=1:length(trainingtactileNet6(:,3))
    if isnan(trainingtactileNet6(i,3)) == 0
        test_acc6(j) = trainingtactileNet6(i,3);
        j = j+1;
    end
end

j=1;
test_acc5 = zeros(1, length(trainingtactResNet)/10);
for i=1:length(trainingtactResNet(:,3))
    if isnan(trainingtactResNet(i,3)) == 0
        test_acc5(j) = trainingtactResNet(i,3);
        j = j+1;
    end
end

% Plot the accuracy of each tactilenet configuration in training and test
% sets
figure
hold on
plot(epochs4,trainingtactileNet4(:,2),'Color',[1 0.6 0])
plot(time_test4,test_acc4,'o-.r', 'LineWidth',1.5);


plot(epochs6,trainingtactileNet6(:,2),'Color',[0 1 0.6])
plot(time_test6,test_acc6,'^-.g', 'LineWidth',1.5);

plot(epochsRes6,trainingtactResNet(:,2),'Color',[0 0.6 1])
plot(time_testRes6,test_acc5,'s-.b', 'LineWidth',1.5);
grid
ylim([0 105]);
xlabel('Epochs')
ylabel('Accuracy [%]')
legend('TactNet-4 training', 'TactNet-4 validation',...
    'TactNet-6 training', 'TactNet-6 validationst',...
    'TactResNet training', 'TactResNet validation')

   