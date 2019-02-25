%% PLOT CONFUSION MATRIX
function Plot_ConfMatrix_IEEE(Matrix)
figure

mat = Matrix;           %# A 5-by-5 matrix of random values from 0 to 1
imagesc(mat);            %# Create a colored plot of the matrix values
colorpa = parula;
color=colorpa;
for i =1:length(colorpa)
        color(i,:) = colorpa(length(colorpa)-i+1,:);
end
colormap(flipud(color));  %# Change the colormap to gray (so higher values are
                         %#   black and lower values are white)

% textStrings = num2str(mat(:),'%0.2f');  %# Create strings from the matrix values
% textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
% [x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
% hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
%                 'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
% textColors = repmat(mat(:) < midValue,1,3);  %# Choose white or black for the
                                             %#   text color of the strings so
                                             %#   they can be easily seen over
                                             %#   the background color
% set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors

set(gca,'XTick',1:8,...                         %# Change the axes tick marks
        'XTickLabel',{'Arm','Fingers','Hand','Pen','Pliers','Scissors','Tape','Allen'},...  %#   and tick labels
        'YTick',1:8,...
        'YTickLabel',{'Arm','Fingers','Hand','Pen','Pliers','Scissors','Tape','Allen'},...
        'TickLength',[0 0]);
% title('SURF-SVM');
    
end