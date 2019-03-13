function theta = Newton(X, y, inter)
    
m = length(y);
theta = zeros(3, 1);

for i = 1:inter,
    h_grad = sigmoid(-y.*X*theta);
    grad = (-1/m)*(X'*(h_grad.*y));   % gradient
    h_hess = sigmoid(X*theta);
    hess = (1/m)*(X'*((h_hess.*(1-h_hess)).*X));  %hessian
    theta = theta - pinv(hess)*grad;
    i = i + 1;
end