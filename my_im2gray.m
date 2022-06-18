% Description: reproduce the im2gray() function behaviour for
% yourself (including some simple Inputs/Outputs comments, below)
%
% Inputs:
% im: an image
% 
% Outputs: 
% im_g: a greyscale image consisting of uint8 values
% 
% Notes: the function should return uint8 values (matching what is passed
% in) but you'll get rounding errors if you perform the conversion
% calculation with uint8 values, so some recasting is needed here
%
function im_g = my_im2gray(im)

    
    %check too ensure image is greyscale by collecting the layer amount
    [row, col, numColor] = size(im);

    %error check as non gray images have more than 1 layer therefore wont
    %accept anything equal to 1 (grayscale)
    if numColor == 1
        im_g = im;
        return;
        %returns grayscale images as it wont process an already gray image
    end

    %converts uint8 to Double for accuracy purposes when multiplying with
    %other doubles
    im = im2double(im);
    
    %collect each layer and store in appropiate variables for eqauation as
    %a class Double
    R = im(1:1:end, 1:1:end,1);
    G = im(1:1:end, 1:1:end,2);
    B = im(1:1:end, 1:1:end,3);
    
    %weighed eqation matlab build in function uses to aquire greyscale
    im  = 0.2989 * R + 0.5870 * G + 0.1140 * B;
    
    %NOTE: the greyscale isnt accurate and some pixels are diffrent howver
    %it visually looks the same

    %converts back to uint8 as the same as built in function uses (0-255)
    im_g = im2uint8(im);

    %isequal(im_g,im)

    %whilst the arrays were not the same the equation was 
    %im my opinion some pre image processing is done before the greyscale
    %conversion before (im2gray) is preformed

    
    
    
end