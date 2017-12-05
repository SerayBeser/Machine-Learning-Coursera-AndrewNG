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


matrix_deger_c = [0.01 0.03 0.1 0.3 1 3 10 30]
matrix_deger_sig = [0.01 0.03 0.1 0.3 1 3 10 30]

hata = 1000


for i = 1:length( matrix_deger_c )
	deger_c = matrix_deger_c( i );
	for j = 1:length( matrix_deger_sig )
		yerel_sig = matrix_deger_sig(j);
		model = svmTrain( X, y, deger_c,@(hasan,seray)gaussianKernel(hasan, seray, yerel_sig ) );
		predictions = svmPredict( model, Xval );
		%In Octave/MATLAB, you can compute this error using
%mean(double(predictions ~= yval)), where predictions is a vector
%containing all the predictions from the SVM, and yval are the true labels
%from the cross validation set.
		yerel_hata = mean( double( predictions ~= yval ) );
		if yerel_hata < hata
			hata = yerel_hata;
			C = deger_c;
			sigma = yerel_sig;
		end
	end
end


% =========================================================================

end
