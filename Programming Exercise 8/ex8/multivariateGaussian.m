function p = multivariateGaussian(X, mu, sigma2)

% X       (m,n)
% mu      (n,1)
% sigma2  (n,1)
% p       (m,1)
% p_matrix (m,n)



t1 = bsxfun(@minus, X, mu'); % (m,n)
t2 = bsxfun(@rdivide, t1, sigma2'); % (m,n)
t3 = t2 * (-1)/2; % (m,n)
t4 = e .^ t3; % %(m,n)
t5 = bsxfun(@rdivide, t4, sigma2') .* t4; %(m,n)
p_matrix = t5 ./ sqrt(2*pi); %(m,n)

p = prod(p_matrix, 2); %(m,1)



end




