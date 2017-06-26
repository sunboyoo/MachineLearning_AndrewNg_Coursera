function [C, sigma] = dataset3Params(X, y, Xval, yval)
% DATASET3PARAMS returns your choice of C and sigma for part 3 of the exercise 
% where you select the optimal (C, sigma) learning parameters to use for SVM with RBF kernel
% [C, sigma] = dataset3Params(X,y,Xval,yval) returns your choice of C and sigma. 
% You should complete this function to return the optimal C and sigma 
% based on a cross validation set.

% You should return the following variables correctly.
C = 1;   % should delete this line
sigma = 0.3; % should delete this line

% ========YOUR CODE HERE========
% Instructions: Fill in this function to return the optimal C and sigma learning parameters
% found using the cross validation set. You can use svmPredict to predict the labels on
% the cross validation set. For example 
% predictions = svmPredict(model, Xval);
% will return the predictions on the cross validation set.
% Note: you can compute the prediction error using
% mean(double(predictions ~= yval))

C_vec = [0.01;0.03;0.1;0.3;1;3;10;30];
sigma_vec = [0.01;0.03;0.1;0.3;1;3;10;30];
error_val = zeros(size(C_vec,1),size(sigma_vec,1));

for i = 1:size(C_vec)
    for j = 1:size(sigma_vec)
          C = C_vec(i);
          sigma = sigma_vec(j);          
          model = svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1, x2,sigma));
          predictions = svmPredict(model, Xval);
          error_val(i,j) = mean(double(predictions~=yval));
    end
end

% ==== Another way to find the minimum row and colomn===========
% [CIndex, sigmaIndex] = find(error_val == min(min(error_val)));
% C = C_vec(CIndex);
% sigma = sigma_vec(sigmaIndex);
%==============================================================

[minval, row] = min(min(error_val,[],2));
[minval, col] = min(min(error_val,[],1));
C = C_vec(row);
sigma = sigma_vec(col);

================
end
