function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
    %GRADIENTDESCENT Performs gradient descent to learn theta
    %   theta = GRADIENTDESCENT(x, y, theta, alpha, num_iters) updates theta by
    %   taking num_iters gradient steps with learning rate alpha

    % Initialize some useful values
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);
    for iter = 1:num_iters
        h = X*theta;
        delta = (h-y)'*X;                   %calculating gradient
        theta = theta - (alpha/m)*delta';   % updating theta 
        
        % Save the cost J in every iteration    
        eachcost = computeCost(X, y, theta);
        J_history(iter) = eachcost;
    end
end
