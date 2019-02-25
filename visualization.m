
img = imread('./Experiment_IEEE/Images/allen_key/allen1.jpg')

act = activations(tactilenet_trained, img, 'pool3','OutputAs','channels');

sz = size(act);
act = reshape(act,[sz(1) sz(2) 1 sz(3)]);
montage(imresize(mat2gray(act),[48 48]))

