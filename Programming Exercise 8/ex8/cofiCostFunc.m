function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
% COFICOSTFUNC Collaborative filtering cost function
% [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
% returns the cost and gradient for the collaborative filtering problem.

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), num_users, num_features);

% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% =====YOUR CODE HERE=========
% Instructions: compute the cost function and gradient for collaborative filtering.
%               concretely, you should first implement the cost function (without regularization)
%               and make sure it matches our costs. After that, you should implement the gradient
%               and use the checkCostFunction routine to check that the gradient is correct.
%               Finally, you should implement regularization.

% Note: 
% X - num_movies x num_features matrix of movie features
% Theta - num_users x num_features matrix of user features
% Y - num_movies x num_user matrix of user ratings of movies
% R - num_movies x num_user matrix, where R(i,j) = 1 if i-th movie was rated by the j-th user
% You should set the following variables correctly:
% X_grad - num_movies x num_features matrix, containing the partial derivatives w.r.t to each element of X
% Theta_grad - num_users x num_features matrix, containing the partial derivatives w.r.t. to each element of Theta







% ==== Compute the Cost J ========
prediction = X * Theta';     %(n_movies,n)x(n,n_user) = (n_movie, n_user)
error = prediction.*R - Y.*R; % error = prediction(R==1) - Y(R==1);
error_Squared = sum(sum(error.^2,1),2)/2;

regularization_Theta = sum(sum(Theta.^2,1),2) * lambda/2;
regularization_X     = sum(sum(X.^2,1),2) * lambda/2;

J = error_Squared + regularization_Theta + regularization_X;


% ==== Compute the Gradient grad =====
Theta_grad = error' * X; % (n_movie, n_user)' * (n_movie, n);
X_grad = error * Theta; % (n_movie, n_user) * (n_user, n);

Theta_grad_regularization = lambda * Theta;  %(n_user, n)
X_grad_regularization     = lambda * X;      %(n_movie, n)

Theta_grad = Theta_grad + Theta_grad_regularization;
X_grad = X_grad + X_grad_regularization;

grad = [X_grad(:);Theta_grad(:)];

end
