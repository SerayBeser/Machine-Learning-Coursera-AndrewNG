function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%







toplam_1 = sum( power( ( X * theta - y ) , 2 ) );
toplam_2 = sum( power( ( theta( 2 : end ) ) , 2 ) );
bolum_1 = ( 1 / ( 2 * m ) );
bolum_2 = ( lambda / ( 2 * m ) );
bolum_3 = ( 1 / m ) ;
fark_1 = ( X * theta - y ) ;

J = bolum_1 * toplam_1 + bolum_2 * toplam_2;

G = (lambda/m).* theta;
G(1) = 0;


grad = (bolum_3 .* X' * fark_1 + G);


% =========================================================================

grad = grad(:);

end
