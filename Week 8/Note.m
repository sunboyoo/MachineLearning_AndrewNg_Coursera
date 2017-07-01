% PCA (Principle Component Anylasis) Algorithm

% Reduce data from n dimensions to k dimension.
% X(m,n) ==>> Z(m,k)
% x(n,1) ==>> z(k,1)

% DATA PREPARATION - Mean Normalization and Feature Scaling
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
%   [U_nn,S,V]  = svd(Sigma_nn);
%   U_reduced_nk = U_nn(:,1:k);
%   Z_mk        = X_mn * U_reduced_nk;          % For Matrix Computation
%   z_kx1       = (U_reduced_nk)' * x_nx1;      % For Vector Computation 
%   z_kx1(j)    = (U_reduced_nk(:,j))' * x_nx1; % For Element Computation
% ==========================================
  

