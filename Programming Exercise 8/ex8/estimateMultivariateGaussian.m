function [mu, sigma2] = estimateMultivariateGaussian(X)
% X (m,n)
% mu (n,1)
% sigma2 (n,n) covarivance matrix

[m,n] = size(X);
mu = zeros(n,1);
sigma2 = zeros(n,n);

mu = mean(X)';         %(1,n)'=(n,1)

t1 = bsxfun(@minus, X, mu'); %(m,n)-(1,n) = (m,n)
sigma2 = t1'*t1 ./ m;        %(n,m)*(m,n) = (n,n)


end
