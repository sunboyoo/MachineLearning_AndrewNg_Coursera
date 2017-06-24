function [J, grad] = linearRegCostFunction (X, y, theta, lambda)
% LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
% regression with multiple variable
% [J, grad] = LINEARREGCOSTFUNCTION (X, y, theta, lambda) computes the 
% cost of using theta as the parameter for linear regression to fit the 
% data points in X and y. Returns the cost in J and the gradient in grad

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

% -----compute cost --------

% Add bias terms to the features of training examples
X_bias = [ones(m,1) X];
h = X_bias * theta; % vector
error = h - y;  % vector
theta_remove_bias = theta(:,2:end);
J = 1/2/m * sum(sum( error .^ 2)) + lambda/2/m * sum(sum(theta_remove_bias .^2 ));

%-----compute cost end ---------



%-----compute grad-------




%-----compute grad end---

%=========================================
grad = grad(:);

end
