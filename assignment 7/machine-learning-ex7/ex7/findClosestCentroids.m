function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

tmp     = ones(size(X,1), 1) *9999;
for i = 1:K
    centroid = centroids(i,:);
    vect     = bsxfun(@minus,X,centroid);
    vect_sq  = vect.^2;
    dist     = sum(vect_sq, 2);     % Sum along columns  
    
    overwrite_indx      = find(dist <= tmp);
    idx(overwrite_indx) = i;        % Sets idx to the closest centroid for current iteration
    tmp(overwrite_indx) = dist(overwrite_indx);
end

% =============================================================
end

