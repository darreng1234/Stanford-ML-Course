function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);

reg = (lambda/(2*m)) * (theta(2:end,:))'*(theta(2:end,:));

J =  sum(-(1/m)*(y'*log(h) + (1 - y)'*log(1 - h))) + reg;

%grad1 = (1/m)*(X(:,1)'*(h - y));

%rem_terms =  (1/m)*(X(:,2:size(theta))'*(h - y)) + (lambda/m)*theta(2:size(theta));

%for iter = 2:size(theta)
  %grad(iter) =  (1/m)*(X(:,iter)'*(h - y)) + (lambda/m)*theta(iter);
  %size((1/m)*(X(:,iter)'*(h - y)) + (lambda/m)*theta(iter))
%endfor

grad = (1/m)*(X'*(h - y)) + [0; (lambda/m) * theta(2:end,:)];



% =============================================================

end
