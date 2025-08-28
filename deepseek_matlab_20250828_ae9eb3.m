% Predict for specific parameters
[K, ETR] = pred(0.0025, 0.07, 10, 293.15);
fprintf('Permeance: %.4f cm/s, ETR: %.2f cm³/h\n', K, ETR);