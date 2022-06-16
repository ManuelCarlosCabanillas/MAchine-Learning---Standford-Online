function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% First we list possible values for C and sigma:

C_val = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_val = [0.01 0.03 0.1 0.3 1 3 10 30];

% Then we iterate through all possible combinations, calculating the predicion 
%error and storing it in a Matrix

for i=1:length(C_val)
  
    for j=1:length(sigma_val)
        C = C_val(i);
        sigma = sigma_val(j);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); %Trains 
% an SVM classifier using a simplified version of the SMO  algorithm.  
        predictions = svmPredict(model, Xval); %vector containing all the 
% predictions from the SVM
        predictions_error(i,j) = mean(double(predictions ~= yval)); %  error on 
%the cross validation set
    end
    
end


min_predictions_error = min(min(predictions_error)); % extract min. prediction error
[i j] = find(predictions_error == min_predictions_error); % take position of min prdiction error in the matrix
C = C_val(i) % extract corresponding C from C values
sigma = sigma_val(j) % extract corresponding sigma from sigma values






% =========================================================================

end
