% Description: use an existing k-NN model to classify some testing examples 
%
% Inputs:
% m: a struct containing details of the k-NN model we want to use
% for classification 
% test_examples: a numeric array containing the testing examples we want to
% classify
% 
% Outputs:
% predictions: a categorical array containing the predicted
% labels (i.e., with the same ordering as test_examples)
%
% Notes:
% Assumes that the model m has been created with a call to knn_fit()
% 
function predictions = knn_predict(m, test_examples)
    
    predictions = categorical;
    %makes the prediction array as a categoical to store the labels

    k = m.NumNeighbors;
    train_examples = m.train_examples;
    train_labels = m.train_labels;
    %makes calls to the m struct to retrive the values

    new= [];
    %empty array for growing
    
    
    for i=1:1:size(test_examples,1)
        for j=1:1:size(train_examples,1)
            
            %loops the size of both test and train examples (30,45)

            q = train_examples(j,:);    
            p = test_examples(i,:);
            %increments over the example array and calculates for distance
            %calculation
    
    
            new(end+1,1) = knn_calculate_distance(p,q);
            %call Euclidean distance and works out the distance between
            %each example type
    
            new(end,2) = j;
            %stores index at 2nd column
            
            if(j == size(train_examples,1))
                %once it loops over every training example it creates
                %positions
    
                  new = sortrows(new,1);
                  %sorts array of Euclidean distance by smallest first (nearest K) 
    
                  new = new([1:k],:);
                  %collects the K amount of data (K smallest)
                  
                  predictions(end+1,:) = mode(train_labels(new(:,2)));
                  %store the mode of the distances or nearest neighbor
    
                  new = [];
                  %reset array helps with speed (only J amount then gets
                  %stored each loop
    
             
            end
        end
    end

    predictions;

end