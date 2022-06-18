% Description: create a model ready to perform k-NN classification
% from some training data (assuming k=1 initially)
%
% Inputs:
% train_examples: a numeric array containing the training examples
% train_labels: a categorical array containing the associated
% labels (i.e., with the same ordering as train_examples)
% 
% Outputs:
% m: a struct holding the parameters of the k-NN model (the
% training examples, the training labels, and a value for k - the number of
% nearest neighbours to use)
% 
% Notes:
% This method should be relatively short and simple, perhaps just a
% few lines of code appropriately commented.
%
function m = knn_fit(train_examples, train_labels,NumNeighbors)

    %ive added more than needed to replicate the KNN
    
    %stores each data for the classifer

    struct.ClassNames = unique(train_labels);
    %collects an array of train labels (one of each)

    struct.NumObservations = size(train_examples,1);
    %number of training examples

    struct.NumNeighbors = NumNeighbors;
    %k value

    struct.train_examples = train_examples;
    struct.train_labels = train_labels;
    %stores both train examples and the labels for convience


    m = struct;
    %adds all the data to the struct

    
end