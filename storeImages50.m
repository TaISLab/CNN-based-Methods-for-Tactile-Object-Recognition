%% STORE PREASSURE DATA AS IMAGES
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Telerobotics and Interactive Systems Lab
% System Engineering and Automation Department
% 20/03/2019
% University of Málaga, Spain
% ------------------------------------------------------------------------- 
% This script takes the data from the .CSV files and convert them into .JPG
% files
% =========================================================================

for i=1:50
    switch i
        case 1, filename='./Experiment_IEEE/Data/bottle/bottle1.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle1.jpg';
        case 2, filename='./Experiment_IEEE/Data/bottle/bottle2.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle2.jpg';
        case 3, filename='./Experiment_IEEE/Data/bottle/bottle3.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle3.jpg';
        case 4, filename='./Experiment_IEEE/Data/bottle/bottle4.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle4.jpg';
        case 5, filename='./Experiment_IEEE/Data/bottle/bottle5.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle5.jpg';
        case 6, filename='./Experiment_IEEE/Data/bottle/bottle6.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle6.jpg';
        case 7, filename='./Experiment_IEEE/Data/bottle/bottle7.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle7.jpg';
        case 8, filename='./Experiment_IEEE/Data/bottle/bottle8.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle8.jpg';
        case 9, filename='./Experiment_IEEE/Data/bottle/bottle9.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle9.jpg';
        case 10, filename='./Experiment_IEEE/Data/bottle/bottle10.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle10.jpg';
        case 11, filename='./Experiment_IEEE/Data/bottle/bottle11.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle11.jpg';
        case 12, filename='./Experiment_IEEE/Data/bottle/bottle12.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle12.jpg';
        case 13, filename='./Experiment_IEEE/Data/bottle/bottle13.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle13.jpg';
        case 14, filename='./Experiment_IEEE/Data/bottle/bottle14.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle14.jpg';
        case 15, filename='./Experiment_IEEE/Data/bottle/bottle15.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle15.jpg';
        case 16, filename='./Experiment_IEEE/Data/bottle/bottle16.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle16.jpg';
        case 17, filename='./Experiment_IEEE/Data/bottle/bottle17.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle17.jpg';
        case 18, filename='./Experiment_IEEE/Data/bottle/bottle18.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle18.jpg';
        case 19, filename='./Experiment_IEEE/Data/bottle/bottle19.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle19.jpg';
        case 20, filename='./Experiment_IEEE/Data/bottle/bottle20.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle20.jpg';
        case 21, filename='./Experiment_IEEE/Data/bottle/bottle21.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle21.jpg';
        case 22, filename='./Experiment_IEEE/Data/bottle/bottle22.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle22.jpg';
        case 23, filename='./Experiment_IEEE/Data/bottle/bottle23.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle23.jpg';
        case 24, filename='./Experiment_IEEE/Data/bottle/bottle24.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle24.jpg';
        case 25, filename='./Experiment_IEEE/Data/bottle/bottle25.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle25.jpg';
        case 26, filename='./Experiment_IEEE/Data/bottle/bottle26.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle26.jpg';
        case 27, filename='./Experiment_IEEE/Data/bottle/bottle27.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle27.jpg';
        case 28, filename='./Experiment_IEEE/Data/bottle/bottle28.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle28.jpg';
        case 29, filename='./Experiment_IEEE/Data/bottle/bottle29.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle29.jpg';
        case 30, filename='./Experiment_IEEE/Data/bottle/bottle30.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle30.jpg';
        case 31, filename='./Experiment_IEEE/Data/bottle/bottle31.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle31.jpg';
        case 32, filename='./Experiment_IEEE/Data/bottle/bottle32.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle32.jpg';
        case 33, filename='./Experiment_IEEE/Data/bottle/bottle33.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle33.jpg';
        case 34, filename='./Experiment_IEEE/Data/bottle/bottle34.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle34.jpg';
        case 35, filename='./Experiment_IEEE/Data/bottle/bottle35.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle35.jpg';
        case 36, filename='./Experiment_IEEE/Data/bottle/bottle36.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle36.jpg';
        case 37, filename='./Experiment_IEEE/Data/bottle/bottle37.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle37.jpg';
        case 38, filename='./Experiment_IEEE/Data/bottle/bottle38.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle38.jpg';
        case 39, filename='./Experiment_IEEE/Data/bottle/bottle39.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle39.jpg';
        case 40, filename='./Experiment_IEEE/Data/bottle/bottle40.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle40.jpg';
        case 41, filename='./Experiment_IEEE/Data/bottle/bottle41.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle41.jpg';
        case 42, filename='./Experiment_IEEE/Data/bottle/bottle42.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle42.jpg';
        case 43, filename='./Experiment_IEEE/Data/bottle/bottle43.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle43.jpg';
        case 44, filename='./Experiment_IEEE/Data/bottle/bottle44.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle44.jpg';
        case 45, filename='./Experiment_IEEE/Data/bottle/bottle45.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle45.jpg';
        case 46, filename='./Experiment_IEEE/Data/bottle/bottle46.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle46.jpg';
        case 47, filename='./Experiment_IEEE/Data/bottle/bottle47.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle47.jpg';
        case 48, filename='./Experiment_IEEE/Data/bottle/bottle48.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle48.jpg';
        case 49, filename='./Experiment_IEEE/Data/bottle/bottle49.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle49.jpg';
        case 50, filename='./Experiment_IEEE/Data/bottle/bottle50.csv';
            savename='./Experiment_IEEE/Images/bottle/bottle50.jpg';
    end
    img=importfile(filename)/255;
    imwrite(img,savename)
end