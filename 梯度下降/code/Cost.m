function J = Cost(X, y, theta)
m = length(y);
J = 0;
J = sum((X * theta - y).^2) / (2*m);
end
