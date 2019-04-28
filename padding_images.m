%% AlexNet_SVM METHOD
%==========================================================================
% Juan M. Gandarias, Jes�s M. G�mez-de-Gabriel and Alfonso J. Garc�a-Cerezo
% Telerobotics and Interactive Systems Lab
% System Engineering and Automation Department
% 20/03/2019
% University of M�laga, Spain
% -------------------------------------------------------------------------
% =========================================================================


function Iout = padding_images(filename)

    I = imread(filename);

    % Resize the image as required for the CNN.
    Iout = padarray(I,[1 1],'both');

    % Note that the aspect ratio is not preserved. In Caltech 101, the
    % object of interest is centered in the image and occupies a
    % majority of the image scene. Therefore, preserving the aspect
    % ratio is not critical. However, for other data sets, it may prove
    % beneficial to preserve the aspect ratio of the original image
    % when resizing.
end