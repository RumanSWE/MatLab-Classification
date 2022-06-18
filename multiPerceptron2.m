function multiPerceptron2(q,r,nodes,func)
%close all, clear clc, format compact
% number of samples of each class
K = 100;
% define 4 clusters of input data
%q = .5; % offset of classes
%r = 1.2; % define the random variation scale
% func = 'tansig'
% and now build the classes
A = [r*(rand(1,K)-q); r*(rand(1,K)+q)];
B = [r*(rand(1,K)+q); r*(rand(1,K)+q)];
C = [r*(rand(1,K)+q); r*(rand(1,K)-q)];
D = [r*(rand(1,K)-q); r*(rand(1,K)-q)];
% plot clusters
figure
plot(A(1,:),A(2,:),'k+')
hold on
grid on
plot(B(1,:),B(2,:),'b*')
plot(C(1,:),C(2,:),'kx')
plot(D(1,:),D(2,:),'bd')
% text labels for clusters
text(.5-q,.5+2*q,'Class A')
text(.5+q,.5+2*q,'Class B')
text(.5+q,.5-2*q,'Class C')
text(.5-q,.5-2*q,'Class D')

% define inputs (combine samples from all four classes)
P = [A B C D]';
% define targets
T = [repmat(1,1,length(A)) repmat(2,1,length(B)) ...
repmat(3,1,length(C)) repmat(4,1,length(D)) ]';

% train a neural network
% [net,tr,Y,E] = train(net,P,T);
net = fitcnet(P,T, 'LayerSizes',nodes,'Activations',func,'Verbose',0);
Y = predict(net,P);


% evaluate performance: decoding network response
[~,i] = max(T); % target class
[~,j] = max(Y); % predicted class
N = length(Y); % number of all samples
k = 0; % number of missclassified samples
if find(i-j) % if there exist missclassified samples
    k = length(find(i-j)); % get a number of missclassified samples
end
fprintf('Correct classified samples: %.1f%% samples\n', 100*(N-k)/N)

% plot classification result for the complete input space
% generate a grid
span = -1:.01:2;
[P1,P2] = meshgrid(span,span);
pp = [P1(:) P2(:)];
% % simulate neural network on a grid
% %aa = net(pp);
aa = predict(net,pp);
% plot classification regions based on MAX activation
bb = zeros(size(aa));
bb(aa==1) = 1;
m = mesh(P1,P2,reshape(bb,length(span),length(span))-5);
set(m,'facecolor',[1 0.2 .7],'linestyle','none');
bb = zeros(size(aa));
bb(aa==2) = 1;
m = mesh(P1,P2,reshape(bb,length(span),length(span))-5);
set(m,'facecolor',[1 1.0 0.5],'linestyle','none');
bb = zeros(size(aa));
bb(aa==3) = 1;
m = mesh(P1,P2,reshape(bb,length(span),length(span))-5);
set(m,'facecolor',[.4 1.0 0.9],'linestyle','none');
bb = zeros(size(aa));
bb(aa==4) = 1;
m = mesh(P1,P2,reshape(bb,length(span),length(span))-5);
set(m,'facecolor',[.3 .4 0.5],'linestyle','none');