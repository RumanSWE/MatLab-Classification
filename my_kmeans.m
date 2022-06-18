%% Description: 
% Takes an array of HOG features and selects a 
% random K amount sample to be processed. Kmeans algorithm randomly
% assigns K clusters and then proceeds to average out the closest centeroid
% until that amount is hardly changing.
%
%% Inputs:
% h: an array of HOG features
% k: numerical amount of K clusters
%
%% Outputs:
% my_kmeans: an array containing all of the processed KMeans numbers
% 

function kmeans = my_kmeans(h,k)

    rng(0); % please leave this re-seeding of the random number generator in place so we can compare results
    
    total = size(h,1) * size(h,2);
    %finds the total amount of elements in array for calculation
    
  
    mySize = total / 9;
    %above calucaltion ensures the reshape works correctly by working out
    %the correct length
    
    mydata = reshape(h,[mySize,9]);
    %data is changed to histogram 9D (width)
    
    samples = randi([1 size(mydata, 1)], k, 1);
    %random index is taken of legnth 500 set by K
    
    centres = mydata(samples,:);
    %random 500 k is taken from entire data array
    
    for i=1:1:size(centres,2)
        for j=1:1:size(centres,1)
            %loops
    
            point = centres(j,:); 
            dist =  [];
    
            idx=randi(length(point),1);
            %selects random center start location at each cluster
            update = point(idx);
            
    
            %LOOP THIS!!!!!!!!!!!!!
            for l=1:1:size(point,1)
                for m=1:1:size(point,2)
                    p = update;
                    q = point(l,m);
                    dist(end+1) = knn_calculate_distance(p,q);
                end
            end
    
            update = min(dist(dist>0));
            indx = find(dist==update);
    
            cloest = centres(j,indx);
            new = cloest+update / 2;
    
            centres(j,indx) = new;
            
    
            %LOOP THIS!!!!!!!!!!!!!
            while new<0.001
                dist =  [];
    
                for l=1:1:size(point,1)
                    for m=1:1:size(point,2)
                        p = new;
                        q = point(l,m);
                        dist(end+1) = knn_calculate_distance(p,q);
                    end
                end
        
                update = min(dist(dist>0));
                indx = find(dist==update);
        
                cloest = centres(j,indx);
                new = cloest+update / 2;
        
                centres(j,indx) = new;
            end
    
    
    
    
            
        end
    end

    kmeans = centres;









end
