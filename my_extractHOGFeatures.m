% Description: given a greyscale image, extract HOG features from patches
% of size 16*16 pixels using 9-bin histograms, and return all the bin
% totals in a single large array
%
% Inputs: im: an image
% 
% Outputs: h an array containing all the resulting bin totals (all
% individual histograms concatenated together)
% 
% Notes: perhaps start with calls to the built-in imgradient_xy() and
% imgradient() functions for computing the maximum rate of increase
% information (you can switch over to your my_*() equivalents once finished
% and check for equivalent results); we suggest a nested for loop over
% image patches; careful with your indices - the function should accept any
% greyscale image and width/height isn't guaranteed to be a multiple of 16
% (practice at the Command Window first is strongly recommended); note it
% doesn't matter whether you loop down columns and then across rows or vice
% versa; there's a tip in the function body below for making the histograms
% (you can take any approach you like but note we do expect you to code
% this process up for yourself - if you start off by using a built-in
% function to help you, then you need to replace it with your own code at a
% later stage; the zeros() function (met in the Matlab Fundamentals) is a
% nice way to initialise an empty 9-bin histogram; you saw how to
% concatenate arrays using []-notation in the Matlab Fundamentals (check
% back or have a play around at the Command Window if unsure); for the
% final standardisation step, you need to treat your final h array as
% definining the coordinates of a point in a feature space and calculate
% its Euclidean distance from the origin; you may have code from your k-NN
% work that you can reuse? - or you can check the k-NN lecture slides for
% the Euclidean distance equation, but notice it simplifies if one of the
% points has all-zeros for its coordinates (as the origin does); once you
% have the distance you simply divide all values in your h array by it (the
% new distance from the origin is then equal to 1)
% 
function h = my_extractHOGFeatures(im)

    im = im2gray(im)
    %converts to grayscale to simplify and speeds up the algorithm
    
    hist = -180:40:140;
    %creates a 9D bin of histograms from -180 to +180 to store the
    %magnitude values at each Feature
    
    [Gx, Gy] = my_imgradientxy(im);
    %call to my to collect the local and horizontal gradients to calculate
    %the magnitude and direction

    [Gmag, Gdir] = my_imgradient(Gx,Gy);
    %my own version to get the magnitude and direction to workout the
    %magnitude bins at each patch
    
    bin = zeros(196,9);
    %creates empty bin array to be replaced upon
    
    row = 0;
    %row index creation to store the bin value
    
    %increments over a 16*16 patch for HOG extraction
    for i=0:16:size(Gdir,1)
        for j=0:16:size(Gdir,2)
    
            if (i < 1)
                i = i+1;
            end
            if (j < 1)
                j = j+1;
            end
            %as it starts at 0 it will always be 1 behind therefore a if
            %statement is there to keep the increment correct
    
            %error checking to see if its in the bounds of the array
            if(j+16 <= size(Gdir,1) && i+16 <= size(Gdir,1))

                dirPatch = Gdir(i:i+15,j:j+15);
                magPatch = Gmag(i:i+15,j:j+15);
                %creates a patch of 16*16 which can be incremeted every
                %time the column increases to extract each HOG feature

                row = row +1;
                %incremets the row index for each loop over J
               
                for l=1:1:size(dirPatch,1)
                    for m=1:1:size(dirPatch,2)
                        %loop over the 16*16 patch at each element to add
                        %each magnitude

                        dir= dirPatch(l,m);
                        %gets each element in array for binning
                        
                        for k=-180:40:140
                            %loop over all the bins to use the index value

                            if(dir >= k) && (dir < k+40)
                                %range check to compare the array item
                                %agasint each bin

                                col = find(hist==k,1);
                                %finds the index by checking which bin it
                                %goes into

                                mag = magPatch(l,m);
                                %collects the magnitude from the same
                                %coordinates as the direction array
    
                                prev = bin(row,col);
                                %colect the previous value in the bin
                         
                                cur = prev+mag;
                                %adds the previous element in the bin to
                                %the new one even if its 0
    
                                bin(row,col) = cur;
                                %adds the previous and current magnitude to
                                %the correct bin
    
                            end
                        end
                    end
                end
            end
        end
    end
    
    h = reshape(bin',1,numel(bin));
    %reshapes the bin to a concat 1D array

    k = sqrt( sum( abs(h) .^ 2 ) );
    %gets the euclidian distance of the entire array to scale the 1D array
    %in a non bias way 

    h = h / k;
    %divide eucidain distance by the 1D array will
    %this will make all items add to 1 intead of 1 being the biggest value
    %and 0 the smallest (better way of scaling)
    
end