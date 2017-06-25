function [error_train, error_val] = learningCurveRandomSelection(X, y, Xval, yval, lambda)
% Learning Curve with Randomly Selected Examples
% X,y - training set with bias term ones
% Xval, yval - cross validation set with bias term ones
% error_train(i) & error_val(i) - the error of training with randomly selected i examples
% Please note m_cv >= m_train

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


close all;
plot(1:m_train, error_train, 1:m_train, error_val);
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')


end
