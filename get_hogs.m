%% Description: convert an image to grayscale and extract HOG
% features from patches of size 16*16 pixels
%
% Inputs:
% im: an image
% 
% Outputs:
% h: an array containing all the HOG features for the image
% 
% Notes: just a simple wrapper function for the built-in
% extractHOGFeatures() function that makes sure the conversion to
% grayscale happens first, and that the 'CellSize' input is set
%
function h = get_hogs(im)

    im = im2gray(im);
    h = my_extractHOGFeatures(im);
    %60% accuracy

    %63.33 accuracy

    %CELLSIZE = [16 16];
    %image patch size

    %[h,v] = extractHOGFeatures(im,'CellSize',CELLSIZE,'BlockSize', [floor(size(im,1)/CELLSIZE(1)) floor(size(im,2)/CELLSIZE(2))],'UseSignedOrientation', true);
    %creates a 1D concat array of histogram bin scores with a few lighting
    %insensitivity options 

    
    
end