function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

for j = 1:K           % iterate once per centroid
  mean_denominator = 0; % temp varaible to compute mean denominator == number of 
                      % examples X assigned to the centroid          
  mean_nominator = zeros(n, 1);  % temp value to compute mean numerator == sum of X values 
                      % which are assigned to the centroid
  for i = 1:m         % to iterate once per X example, this is idx size 
    if ( idx(i) == j ) % if index in idx == j then we update the numerator and denominator
      mean_nominator = mean_nominator + X(i, :)';
      mean_denominator = mean_denominator + 1;
    end
  end
  centroids(j, :) = (mean_nominator/mean_denominator)'; % update the value of the centroids with the new mean
end






% =============================================================


end

