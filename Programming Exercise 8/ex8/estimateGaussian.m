function [mu, sigma2] = estimateGaussian(X)

%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% X is (m,n)

% ====Useful Variables====
[m,n] = size(X);

% =====Return these values=====
mu = zeros(n,1);
sigma2 = zeros(n,1);


% =====% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.

mu = mean(X)';    % (n,1) = (1,n)'

t1 = bsxfun(@minus, X, mu');
sigma2 = mean(t1 .^ 2)'; % (n,1) = (1,n)'



end




