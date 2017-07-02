function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);


% =======NOTE by Kevin Liu======

% NOTE 1
%     std(X) equals to std(X_norm), therefore, the two lines below are same.
%     sigma = std(X_norm);
%     sigma = std(X);

% NOTE 2
%     Step 1 is Mean Normalization
%     mu = mean(X);
%     X_norm = bsxfun(@minus, X, mu);
%     Step 2 is Feature Scaling
%     sigma = std(X_norm);
%     X_norm = bsxfun(@rdivide, X_norm, sigma);

end
