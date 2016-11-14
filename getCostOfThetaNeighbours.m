function [theta1, theta2, costs] = getCostOfThetaNeighbours(theta, X, y, num_neighbours_x, step_x, num_neighbours_y, step_y)
    % num_neighbours : number of neighbours to sample with theta as the center
    % step : steps size for the neighbours
    % for eg. theta = [122; 9]
    %   theta(2,1) = 9
    %   num_neighbours_y = 4 and step_y = 0.5
    %   theta2 = [8 8.5 9 9.5 10]
    % and simimlarly for theta(1,1) for X axis of the graph
    add_theta_1 = -num_neighbours_x/2 : num_neighbours_x/2;
    add_theta_1 = add_theta_1*step_x;
    theta1 = add_theta_1 + theta(1,1);
    add_theta_2 = -num_neighbours_y/2 : num_neighbours_y/2;
    add_theta_2 = add_theta_2*step_y;
    theta2 = add_theta_2 + theta(2,1);
    costs = zeros(length(theta2), length(1));
    for iter_i = 1:length(theta1)
        for iter_j = 1:length(theta2)
            costs(iter_j, iter_i) = computeCost(X, y, [theta1(iter_i); theta2(iter_j)]);
        end
    end
end