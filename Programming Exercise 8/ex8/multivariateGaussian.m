function p = multivariateGaussian(X, mu, sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
%

% X       (m,n)
% mu      (n,1)
% sigma2  (n,1) vector or (n,n) covariance matrix
% p       (m,1)

[m,n] = size(X);

% ====If sigma2 is a vector, transform to diagonal covariance matrix===
if ( size(sigma2,1) == 1) || (size(sigma2,2) == 1)
    sigma2 = diag(sigma2);
end

t1 = bsxfun(@minus, X, mu');    % (m,n) - (1,n) = (m,n)
t2 = t1 * pinv(sigma2) * t1 *(-1/2);    % (n,m)x(n,n)x(m,n) = (m,n)
t3 = sum(t2,2);                 % (m,n) -> (m,1)
p = (2*pi)^(-n/2))*(det(sigma2)^(-1/2)) .* exp(t3);  %(m,1)

end




