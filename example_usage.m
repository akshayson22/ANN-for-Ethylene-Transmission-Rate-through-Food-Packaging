% EXAMPLE_USAGE.M
% Example script demonstrating how to use the pred function

% Example 1: Typical values
[K1, ETR1] = pred(0.0025, 0.07, 10, 293.15);
fprintf('Example 1 - Film: 25μm, Perf: 700μm, Air: 0.1m/s, Temp: 20°C\n');
fprintf('K: %.4f cm/s, ETR: %.2f cm³/h\n\n', K1, ETR1);

% Example 2: Different parameters
[K2, ETR2] = pred(0.0030, 0.05, 15, 298.15);
fprintf('Example 2 - Film: 30μm, Perf: 500μm, Air: 0.15m/s, Temp: 25°C\n');
fprintf('K: %.4f cm/s, ETR: %.2f cm³/h\n\n', K2, ETR2);

% Example 3: Another set
[K3, ETR3] = pred(0.0020, 0.09, 5, 288.15);
fprintf('Example 3 - Film: 20μm, Perf: 900μm, Air: 0.05m/s, Temp: 15°C\n');
fprintf('K: %.4f cm/s, ETR: %.2f cm³/h\n', K3, ETR3);