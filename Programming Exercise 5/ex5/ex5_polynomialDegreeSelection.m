%% Machine Learning Online Class
%  Exercise 5 | Regularized Linear Regression and Bias-Variance
%

% For teh purpose of testing polynomialDegreeSelection fuction

%% Initialization
clear ; close all; clc


% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% Load from ex5data1: 
% You will have X, y, Xval, yval, Xtest, ytest in your environment
load ('ex5data1.mat');

% m = Number of examples
m = size(X, 1);

% Plot training data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');

fprintf('Program paused. Press enter to continue.\n');
pause;


lambda_forDegreeSelection  = [0;0.01;0.1;1;3;10];

for i = 1:size(lambda_forDegreeSelection,1)

d_max = 20;
[error_train, error_val] = polynomialDegreeSelection(X,y,Xval,yval,d_max,lambda_forDegreeSelection(i));

figure(i);
plot(1:d_max, error_train, 1:d_max, error_val);
legend('Train', 'Cross Validation');
xlabel(sprintf('Degree of Polynomial with lambda = %f', lambda_forDegreeSelection(i)) );
ylabel('Error');

fprintf('Degree of Polynomial\t\tTrain Error\tValidation Error\n');
for i = 1:d_max
	fprintf(' %f\t\t%f\t\t%f\n', ...
            i, error_train(i), error_val(i));
end

end



