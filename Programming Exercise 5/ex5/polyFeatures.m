function [X_poly] = polyFeatures(X,p)
% POLYFEATURES Maps X (1D vector) into the p-th power
% [X_poly] = polyFeatures(X,p) takes a data matrix X (size mx1) and 
% maps each example into its polynomial features where
% X_poly(i,:) = [X(i) X(i).^2 X(i).^3 ... X(i).^p]

% You need to return the following variable correctly.
X_poly = zeros(numel(X),p); % Matrix(m,p)

% ==========YOUR CODE HERE================
% Instructions: Given a vetor X, return a matrix X_poly where the p-th
% column of X contains the values of X to the p-th power.

for i = 1:p
    X_poly(:,i) = X.^i;
endfor




% ========================================

end
