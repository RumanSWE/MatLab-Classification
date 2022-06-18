function perform = train_MNISTnn(nodeVec,train_params,train_labels,test_params,test_labels)


%perform = [];

%nodeVec
%train_params

i = nodeVec(:,1);
j = nodeVec(:,2);

t = train_params(i,j);

a = train_labels(i);
b = train_labels(j);

if(t == 0)
    if(a < b)
        perform = a;
    elseif (b < a)
        perform = b;
    end
end