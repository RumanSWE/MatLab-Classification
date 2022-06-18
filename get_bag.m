% Description: take an array of HOG features extracted from a single image,
% and an array of visual words (or cluster centres within a 9D
% histogram-space), and return a bag (histogram) of visual words
%
% Inputs: 
% h: an array of HOG features for one image 
% words: a 2D array containing the visual words (coordinates of cluster
% centres, one cluster per row)
% 
% Outputs: 
% bag: an array containing the resulting bag (a set of bin scores, one bin
% per visual word)
% 
% Notes: You need to work with one HOG feature at a time, so consider
% reshaping h, or looping over it appropriately; you can initialise an
% empty bag with the zeros() function; you don't need to take any steps to
% normalise your bags
%
function bag = get_bag(h, words)
    

    total = size(h,1) * size(h,2);
    %gets the total size of h
    
    mySize = total / 9;
    %size of the array divided by 9 (as 9D histogram array)
    
    h = reshape(h,[mySize,9]);
    %reshapped array to size*9
    
   
    hist = 1:size(words,1);
    %creates incremeted array the size of the array (500)

    t = zeros(1,size(words,1));
    %creates empty zeros array to place into the bins

    %concats the empty array and index array for binning process
    hist = [hist ;t];

    new = [];
    %creates empty array for growing
    
    for i=1:1:size(h,1)
        for j=1:1:size(words,1)
            %loops over the length of visual words and HOG features
    
            q = words(j,:);
            p = h(i,:);
            %indexs both arrays for working out the distances
    
            new(end+1,1) = knn_calculate_distance(p,q);
            %call Euclidean distance calculator on each point for distance
            %calculation
    
            new(end,2) = j;
            %adds the index for binning process
    
            if(j == size(words,1))
                %once it loops over every length of word the sorting begins
              
                new = sortrows(new,1);
                %sorts array by smallest distance first(closest visual word)
    
                cur = hist(2,new(1,2));
                %gets the indexed position of the closest visual word on
                %the histogram array
                
    
                hist(2,new(1,2)) = cur+1;
                %adds increment at indexed word position to new histogram bin
                %array
    
                new = [];
                %clears array for next set of data
    
            end
        end
    end
        
    
    bag = hist(2,1:1:end);
    %removes the temporay word count used for the bining process


end