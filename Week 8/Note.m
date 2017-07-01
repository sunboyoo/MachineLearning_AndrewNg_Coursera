% PCA (Principle Component Anylasis) Algorithm

% Reduce data from n dimensions to k dimension.
% X(m,n) ==>> Z(m,k)
% x(n,1) ==>> z(k,1)

% DATA PREPARATION - Mean Normalization
% DATA PREPARATION - Feature Scaling

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
%   U_reduce_nk = U_nn(:,1:k);
%   Z_mk        = X_mn * U_reduce_nk;
% ==========================================
  
  
  
% ========= For Vector Computation =========
%   Sigma_nn    = (1/m) * (X_mn)' * X_mn;
%   [U_nn,S,V]  = svd(Sigma_nn);
%   U_reduce_nk = U_nn(:,1:k);
%   z_kx1        = (U_reduce_nk)' * x_nx1;
% ==========================================
