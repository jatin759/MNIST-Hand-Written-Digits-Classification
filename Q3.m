clc;
clear all;
X =  dlmread('data.txt');
 load('z.mat');
 X=z;
 size(X);
 %X1 = vec2mat(X(4234,:) , 20);
 %imshow(X1);
 
 Y = dlmread('label.txt');
 size(Y);
 k = 5;
 [n m] = size(Y)
 idx = kmeans(X,k);
 size(idx);
 Y1 = zeros(n,1);
 for i=1:n
     for j=1:m
         if(Y(i,j) == 1)
            Y1(i,1) = mod(j,10);
            break;
         end
     end
 end
 Y1;
mat = zeros(k,10);
 
for i =1:n
    mat(idx(i),Y1(i)+1) = mat(idx(i),Y1(i)+1) + 1;  
end
% mat -> Rows represnt no. of clusters and columns represents different 10 digits

[m1 , m2] = size(mat)
mfd = zeros(1,m1);
for i=1:m1
    p=0;
    for j=1:m2
       if(mat(i,j)>p)
         p = mat(i,j);
         mfd(i) = mod(j-1,10);
         mfl(i) = j;
       end
    end
end

cmat = zeros(10,10);
for i=1:k
   for j=1:10
       cmat(mfl(i),j) = cmat(mfl(i),j) + mat(i,j);
   end
end

cmat
mfd
S = sum(mat,2);

for i =1:m1
   S(i) = S(i) - mat(i,mfl(i)); 
end 
miss = sum(S);

acc = ((n-miss)/n)*100
% plotconfusion(idx,Y1);
% Y1 = [1 2 1 1 3 2]; % True classes
% idx = [1 3 1 2 3 1]; % Predicted classes
% Convert this data to a [numClasses x 6] matrix
% targets = zeros(k,n);
% outputs = zeros(k,n);
% targetsIdx = sub2ind(size(targets), Y1'+1, 1:n);
% outputsIdx = sub2ind(size(outputs), idx', 1:n);
% targets(targetsIdx) = 1;
% outputs(outputsIdx) = 1;
% % Plot the confusion matrix for a 3-class problem
% plotconfusion(targets,outputs)