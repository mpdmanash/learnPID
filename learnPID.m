%% Lean PID values of a controller from operators behavior
%  Input:
%      1) Matrix X: n*3 matrix. Each row contains (error, sum_of_error, error_difference)
%      2) Matrix Y: n*1 matrix. The user's stick response corresponding to the above error values.
% Output:
%      P, I, D values (theta) required in a PID loop controller with the equation
%      "stick = P*error + I*sum_of_error + D*error_diffence"
%      learnt from the operators response to the error values.
%
clear ; close all; clc

%% ========= Load Data =================
X_for_x_axis = csvread("Dataset/X_x.csv");
Y_for_x_axis = csvread("Dataset/Y_x.csv");
X_for_y_axis = csvread("Dataset/X_y.csv");
Y_for_y_axis = csvread("Dataset/Y_y.csv");
m_x = length(Y_for_x_axis);
m_y = length(Y_for_y_axis);
% Remove the sum_of_error column to learn only P and D.
X_for_x_axis(:,[2]) = [];
X_for_y_axis(:,[2]) = [];

fprintf('Data loaded \n');

% Learning Parameters
alpha = 0.03;
num_iters = 1000;
%size(X_for_y_axis,2)

% Init Theta and Run Gradient Descent 
fprintf('Running Gradient Descent \n');
theta_x = zeros(2, 1);
[theta_x, J_history_x] = gradientDescent(X_for_x_axis, Y_for_x_axis, theta_x, alpha, num_iters);
theta_y = zeros(2, 1);
[theta_y, J_history_y] = gradientDescent(X_for_y_axis, Y_for_y_axis, theta_y, alpha, num_iters);

% Plot the convergence graphs
figure();
subplot(1,2,1)
plot(1:numel(J_history_x), J_history_x, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost Jx');

subplot(1,2,2)
plot(1:numel(J_history_y), J_history_y, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost Jy');

% Display Result
fprintf('Learnt PID values for X axis: \n');
fprintf(' %f \n', theta_x);
fprintf('Learnt PID values for Y axis: \n');
fprintf(' %f \n', theta_y);
fprintf('\n');
