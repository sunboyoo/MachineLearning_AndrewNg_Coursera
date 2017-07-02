function idx = findClosestCentroids(X, centroids)

% FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
m = size(X,1);

% You need to return the following variables correctly.
idx = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% X - matrix(m,n)
% centroids - (k,n)


% ====== For Loop Method ======
% distance = zeros(K,1);
% for i = 1:m
%     distance = sum( (centroids - X(i,:)).^2, 2 );
%     [minval, idx(i)] = min(distance);
% end
% ============

% ====== Vectorized Method ======
t1 = permute(centroids,[3 2 1]);    % (k,n,1) ==>> (1,n,k)
t2 = bsxfun(@minus, X, t1);         % (m,n,1) - (1,n,k) ==>> (m,n,k)
t3 = t2 .^ 2;                       % (m,n,k)
t4 = sum(t3, 2);                     % (m,1,k)
[minval idx] = min(t4,[],3);        % idx(m,1) minval(m,1)
% ======


end
