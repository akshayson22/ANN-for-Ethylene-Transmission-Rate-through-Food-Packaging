% EXTRACT_WEIGHTS.M
% Script to extract weights and biases from a trained neural network object 'net'
% This script is provided for reference and requires the original 'net' object

% Load or create the trained network object 'net' first
% load('trained_network.mat'); % Uncomment if you have a saved network

% Extract weights and biases
u = net.IW{1};    % Input-to-hidden layer weights
w = net.LW{2};    % Hidden-to-output layer weights
th = net.b{1};    % Hidden layer biases
to = net.b{2};    % Output layer biases

% Display the extracted values
disp('Input-to-Hidden Layer Weights (u):');
disp(u);

disp('Hidden Layer Biases (th):');
disp(th);

disp('Hidden-to-Output Layer Weights (w):');
disp(w);

disp('Output Layer Bias (to):');
disp(to);

% Save the extracted values for hard-coding
save('network_weights.mat', 'u', 'w', 'th', 'to');
disp('Weights and biases saved to network_weights.mat');