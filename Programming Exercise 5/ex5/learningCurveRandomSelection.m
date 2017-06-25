function [error_train, error_val] = learningCurveRandomSelection(X, y, Xval, yval, lambda)
% Learning Curve with Randomly Selected Examples
% X,y - training set with bias term ones
% Xval, yval - cross validation set with bias term ones
% error_train(i) & error_val(i) - the error of training with randomly selected i examples
% Please note m_cv >= m_train

% Optional (ungraded) exercise: Plotting learning
% curves with randomly selected examples
% In practice, especially for small training sets, when you plot learning curves
% to debug your algorithms, it is often helpful to average across multiple sets
% of randomly selected examples to determine the training error and cross
% validation error.
% Concretely, to determine the training error and cross validation error for
% i examples, you should first randomly select i examples from the training set
% and i examples from the cross validation set. You will then learn the param-
% eters theta using the randomly chosen training set and evaluate the parameters
% theta on the randomly chosen training set and cross validation set. The above
% steps should then be repeated multiple times (say 50) and the averaged error
% should be used to determine the training error and cross validation error for
% i examples.


m_train = size(X,1);
m_cv = size(Xval,1);
num_RandomSelection = 50;

error_train = zeros(m_train,1);
error_val = zeros(m_train,1); % I made a mistake by defining error_val = zeros(m_cv,1)

for i = 1:m_train
    for j = 1:num_RandomSelection
        RandomIndex = randperm(m_train, i);
        X_RandomI = X(RandomIndex,:);
        y_RandomI = y(RandomIndex,:);
        Xval_RandomI = Xval(RandomIndex,:);
        yval_RandomI = yval(RandomIndex,:);
        
        theta = trainLinearReg(X_RandomI,y_RandomI,lambda);
        [J_train, grad] = linearRegCostFunction(X_RandomI,y_RandomI,theta,0);
        [J_cv, grad] = linearRegCostFunction(Xval_RandomI,yval_RandomI,theta,0);
        error_train(i) = error_train(i) + J_train / num_RandomSelection;
        error_val(i) = error_val(i) + J_cv / num_RandomSelection;
     end
end

% Visualization
close all;
plot(1:m_train, error_train, 1:m_train, error_val);
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')


end
