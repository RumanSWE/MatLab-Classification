% Description: calculate average brightness from an image by converting it
% to grayscale (black and white), summing up the brightness values at every
% pixel, and dividing by the total number of pixels
%
% Inputs: im: an image
% 
% Outputs: b: a double precisions measure of average brightness per pixel
% 
% Notes: the sum() function (which is handy for using in your solution)
% doesn't mind what data types you pass it, it will always hand you back a
% double precision answer. (So you don't need to worry about doing and
% recasting in your solution)

function b = get_brightness(im)

    %converts RBG image to greyscale (1 layer)
    
    %im = im2gray(im);
    im = my_im2gray(im);

    %counts the total amount of elements in the array (total length*width)
    total = numel(im);

    %all of the elements divded by all brightness values added up gets the
    %average brightness at each pixel (in greyscale)
    b = total \ sum(im(1:1:end));
    
end