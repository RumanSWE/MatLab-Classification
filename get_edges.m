% Description: generate estimates of the fraction of vertical and
% horizontal edge pixels in an image by calling imgradientxy to compute
% local gradients in each direction and thresholding the magnitudes in the
% two resulting matrices
%
% Inputs: im: an image
% 
% Outputs: edges: array containing the fraction of all gradient magnitudes
% above the threshold in the horizontal direction (inside edges(1)) and the
% fraction of all gradient magnitudes above the threshold in the vertical
% direction (inside edges(2))
% 
function edges = get_edges(im)

    %greyscale conversion to one layer (helps edges stand out)
    im = im2gray(im);
    
    %[Gx,Gy] = imgradientxy(im,'prewitt');
    %call to original for speed purposes


    %own call to imgradientxy which produced a 1 to 1 exact result
    [Gx,Gy] = my_imgradientxy(im);

    
    %absoulte value to tell how big the edge contast is
    Gx = abs(Gx);
    Gy = abs(Gy);

    %this threshold allows edges to represted as 1s
    Gx = Gx >= 45;
    Gy = Gy >= 45;
    
    %total elements divded by 1 to get the total amount of edges in the X
    %and Y
    y = numel(Gy) \ sum(Gy(:) == 1);
    x = numel(Gx) \ sum(Gx(:) == 1);


    edges = [x y];


end