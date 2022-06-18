
% Description: take a large array of 9-bin HOG features extracted from a
% set of images, and search for 500 clusters (or 'visual words') within the
% 9D histogram-space distribution
% 
% Inputs:
% H: an array of HOG features (we recommend one row for each image)
% 
% Outputs:
% words: a 2D array containing the coordinates of the 500 resulting cluster
% centres in the 9D histogram space, one cluster per row.
% 
% Notes: You can use the k-means algorithm to identify the K=500 cluster
% centres. But consider if/how you will need to reshape the data inside H
% before you call it. Be careful to initialise the k-means algorithm in a
% repeatable way, selecting K points in your data as the starting estimates
% for the cluster centres (see also the lecture slides) - this will
% eventually allow you implement the k-means algorithm for yourself and
% check the technical correctness of your work by using exactly the same
% initialisation
% 
function words = get_words(H)

    
    rng(0); % please leave this re-seeding of the random number generator in place so we can compare results
  
    total = size(H,1) * size(H,2);
    %calculates the total size of the array for reshapping
   
    mySize = total / 9;
    %9 being the 9D hisogram arrays
    
    mydata = reshape(H,[mySize,9]);
    %data is changed to hisogram 9D stardard of any length of rows

    k=500;
    %K set to 500 clusters
    
    samples = randi([1 size(mydata, 1)], k, 1);
    %random sample is taken of row legnth 500 set by K

    [~, words] = kmeans(mydata, k, 'Start', mydata(samples,:));
    %looks for K amount of clusters in the array (one cluster to one row)
   


end