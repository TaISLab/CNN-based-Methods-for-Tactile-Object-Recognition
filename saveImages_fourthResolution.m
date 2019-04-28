%% SAVE 1/16 resolution
%==========================================================================
% Juan M. Gandarias, Jesús M. Gómez-de-Gabriel and Alfonso J. García-Cerezo
% Telerobotics and Interactive Systems Lab
% System Engineering and Automation Department
% 20/03/2019
% University of Málaga, Spain
% -------------------------------------------------------------------------
% Script to reduce tactile images to 1/16 resolution
% =========================================================================

images_dir = fullfile('Experiment_IEEE/Images');

images = imageDatastore(images_dir,'IncludeSubfolders',true,'LabelSource',...
    'foldernames','FileExtensions','.jpg');

for i = 1:50
    img = imresize(imread(images.Files{i+50*21}),[7 13]);
   
    switch i
        case 1
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube1.jpg';
        case 2
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube2.jpg';
        case 3
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube3.jpg';
        case 4
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube4.jpg';
        case 5
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube5.jpg';
        case 6
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube6.jpg';
        case 7
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube7.jpg';
        case 8
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube8.jpg';
        case 9
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube9.jpg';
        case 10
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube10.jpg';
        case 11
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube11.jpg';
        case 12
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube12.jpg';
        case 13
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube13.jpg';
        case 14
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube14.jpg';
        case 15
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube15.jpg';
        case 16
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube16.jpg';
        case 17
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube17.jpg';
        case 18
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube18.jpg';
        case 19
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube19.jpg';
        case 20
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube20.jpg';
        case 21
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube21.jpg';
        case 22
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube22.jpg';
        case 23
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube23.jpg';
        case 24
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube24.jpg';
        case 25
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube25.jpg';
        case 26
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube26.jpg';
        case 27
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube27.jpg';
        case 28
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube28.jpg';
        case 29
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube29.jpg';
        case 30
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube30.jpg';
        case 31
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube31.jpg';
        case 32
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube32.jpg';
        case 33
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube33.jpg';
        case 34
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube34.jpg';
        case 35
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube35.jpg';
        case 36
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube36.jpg';
        case 37
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube37.jpg';
        case 38
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube38.jpg';
        case 39
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube39.jpg';
        case 40
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube40.jpg';
        case 41
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube41.jpg';
        case 42
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube42.jpg';
        case 43
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube43.jpg';
        case 44
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube44.jpg';
        case 45
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube45.jpg';
        case 46
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube46.jpg';
        case 47
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube47.jpg';
        case 48
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube48.jpg';
        case 49
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube49.jpg';
        case 50
            savename='./Experiment_IEEE/Images_fourthRes/tube/tube50.jpg';
    end
    imwrite(img,savename)
end

