% PCA (Principle Component Anylasis) Algorithm

% (1) Compress Data   X(m,n) ==>> Z(m,k)
% (2) Reconstruction Data Z(m,k) ==>> Xapprox(m,n)
% (3) Choose the best compressed k dimensions Xapprox(m,n) == X(m,n)

% (1)
% Reduce data from n dimensions to k dimension.
% X(m,n) ==>> Z(m,k)
% x(n,1) ==>> z(k,1)

% DATA PREPARATION - Mean Normalization (MUST) and Feature Scaling(OPTIONAL)
% X = (X - mean) / std;

% ========================================================================
% STEP 1 - Compute Covariance Matrix

%   X_mn = Matrix(m,n); % training dataset
%   Sigma_nn = (1/m) * (X_mn)' * X_mn; % Matrix(n,n) % covariance matrix 

% STEP 2 - Compute Eigenvectors of the Covariance Matrix

%   [U_nn,S,V] = svd(Sigma_nn); 
%   U_reduce_nk = U_nn(:,1:k); % Matrix(n,k)

% STEP 3 = Compute k dimensions

% Z = X_mn * U_reduce_nk; % (m,n)*(n,k) ==>> (m,k)
% =========================================================================



% ======== For Matrix Computation ==========
%   Sigma_nn    = (1/m) * (X_mn)' * X_mn;
%   [U_nn,S_nn,V]  = svd(Sigma_nn);
%   U_reduced_nk = U_nn(:,1:k);
%   Z_mk        = X_mn * U_reduced_nk;          % For Matrix Computation
%   z_kx1       = (U_reduced_nk)' * x_nx1;      % For Vector Computation 
%   z_kx1(j)    = (U_reduced_nk(:,j))' * x_nx1; % For Element Computation
% ==========================================

% (2)
% Reconstruction from compressed data
% Z(m,k) ==>> X_approx(m,n) == X(m,n)
% z(k,1) ==>> x_approx(n,1) == x(n,1)


% x_approx_nx1 = U_reduced_nk * z_kx1;   % For Vector Computation 
% X_approx_mn = Z_mk * U_reduced_nk';    % For Matrix Computation

% (3) 
% [U,S_nn,V] = svd(Sigma);
% Pick the smallest k
% Check 1 - ( sum_i=1:k(S(i,i)) / sum_i=1:n(S(i,i)) ) <= 0.01
% or Check  sum_i=1:k(S(i,i)) / sum_i=1:n(S(i,i)) >= 0.99
% 99% of variance is retained



