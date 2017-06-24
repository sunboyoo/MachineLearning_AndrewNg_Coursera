function [J, grad] = linearRegCostFunction (X, y, theta, lambda)
% LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
% regression with multiple variable
% [J, grad] = LINEARREGCOSTFUNCTION (X, y, theta, lambda) computes the 
% cost of using theta as the parameter for linear regression to fit the 
% data points in X and y. Returns the cost in J and the gradient in grad

% X already contains bias term zeros.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% =============YOUR CODE HERE=============
% Instructions: Compute the cost and gradient of regularized linear
% regression for a particular choice of theta.
% You should set J to the cost and grad to the gradient.

% Initialize some useful values
% m is the number of training examples
% n is the number of features
% h is the predictions, vector
m = size(X,1);
n = size(X,2);
h = zeros(size(y));
J_Regularization = 0;
grad_Regularization = zeros(size(theta));

% -----compute cost --------
% X already contains the bais term zeros.
h = X * theta; % vector
error = h - y;  % vector
theta_remove_bias = theta(:,2:end);
J = 1/2/m * sum(sum( error .^ 2)) ;
J_Regularization = lambda/2/m * sum(sum(theta_remove_bias .^2 ));
J = J + J_Regularization;

%-----compute grad-------
grad = 1/m * X' * error; % (n+1,m)x(m,1) = (n+1,1)
grad_Regularization = lambda / m * theta; %(n+1,1)
grad_Regularization(1) = 0;
grad = grad + grad_Regularization;

%=========================================
grad = grad(:);

end
