function J = computeCost(X, y, theta)
    %COMPUTECOST Compute cost for linear regression with multiple variables
    %   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    %   parameter for linear regression to fit the data points in X and y

    % Initialize some useful values
    m = length(y); % number of training examples
    n = size(X,2); % number of feature vectors
    h = X*theta; % hypothesis: h = P*error + I*sum_of_error + D*error_difference
    J = ((h-y)'*(h-y))/(2*m);
end
