function [error_train, error_val] = polynomialDegreeSelection(X,y,Xval,yval,d_max,lambda)
% error_train is a vector (dmax,1)  error_train(d) is the train error on d degree of polynomial model
% error_val is a vector (dmax,1) error_val(d) is the cross validation error on d degree of polynomial model
% X is matrix(m_train,1), without bias term ones
% y is vector(m_train,1)
% Xval is matrix(m_val,1), without bias term ones
% yval is vector(m_val,1)
% d_max is the maximum degree

% PENDING: should lambda be used for polynomial degree selection? I believe yes. However, I believe the best
%           practice is to use a set of lambda

% Initialize some useful values
% lambda = 3 was selected on programming exercise 5, it should change for new cases.
% 20th degree polynomials are unrealistic. You run out of precision in the floating point format pretty easily
% when you are raising a value to the 8th power, let alone 20th power.

d_max = 10; 
lambda = 3; 

% Step 1 > working on polynomial in d degree
% Step 2 > train the model with training dataset to find the parameter theta
% Step 3 > compute train error and cross validation error with parameter theta
% Step 4 > working on polynomial in (d+1) degree

d = 1;
X_with_bias = [ones(size(X,1),1), X];
Xval_with_bias = [ones(size(Xval,1),1), Xval];
theta = trainLinearReg(X_with_bias, y, lambda);
[error_train(d), grad] = linearRegCostFunction(X_with_bias, y, theta, 0);
[error_val(d), grad] = linearRegCostFunction(Xval_with_bias, yval, theta, 0);

for d = 2:d_max
    
    % Polynomialize Features
    X_poly = polyFeatures(X, d); % Matrix(m,d)
    Xval_poly = polyFeatures(Xval, d); % Matrix(m_val,d)

    
    % Feature Normalizaton
    % NOTE: Normalize the training dataset and find the mu and sigma
    % NOTE: Normalize the cross validation dataset with mu and sigma
    [X_poly, mu, sigma] = featureNormalize(X_poly);
    Xval_poly = bsxfun(@minus, Xval_poly, mu);
    Xval_poly = bsxfun(@rdivide, Xval_poly, sigma);

    % Add Bias Term Ones
    X_poly_with_bias = [ones(size(X_poly,1),1), X_poly];
    Xval_poly_with_bias = [ones(size(Xval_poly,1),1), Xval_poly];

    % Train the Model to Learn the Parameters theta
    theta = trainLinearReg(X_poly_with_bias,y,lambda);
    
    % Compute Errors with the Parameters theta
    [error_train(d), grad] = linearRegCostFunction(X_poly_with_bias, y, theta, 0);
    [error_val(d), grad] = linearRegCostFunction(Xval_poly_with_bias, yval, theta, 0);

end


end
