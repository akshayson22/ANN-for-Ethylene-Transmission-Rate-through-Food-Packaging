function [K, ETR] = pred(X5, X6, X7, X8)
%PRED Predicts ethylene permeance and transmission rate through perforated packaging film.
%   [K, ETR] = PRED(X5, X6, X7, X8) returns the ethylene permeance (K) and
%   Ethylene Transmission Rate (ETR) for given inputs.
%
%   Inputs:
%       X5 : Film thickness (cm)
%       X6 : Perforation diameter (cm)
%       X7 : Air velocity (cm/s)
%       X8 : Temperature (K)
%
%   Outputs:
%       K   : Ethylene permeance or convective mass transfer coefficient (cm/s)
%       ETR : Ethylene transmission rate (cm³/h)
%
%   Reference:
%       Sonawane et al. (2022). Ethylene permeance through perforated packaging film:
%       Modelling and effect of air velocity, temperature, film thickness and
%       perforation diameter. Food Packaging and Shelf Life, 34, 100961.
%       https://doi.org/10.1016/j.fpsl.2022.100961
%
%   Example:
%       [K, ETR] = pred(0.0025, 0.07, 10, 293.15);

% Unit conversion
X1 = X5 * 10e3;      % Film thickness (cm → μm)
X2 = X6 * 10e3;      % Perforation diameter (cm → μm)
X3 = X7 / 100;       % Air velocity (cm/s → m/s)
X4 = X8 - 273.15;    % Temperature (K → °C)

% Coded values of independent variables X (-1 to +1)
x(1) = (((X1 - 20) / (30 - 20) * 2)) - 1;
x(2) = (((X2 - 556.8) / (936 - 556.8) * 2)) - 1;
x(3) = (((X3 - 0.0112) / (0.185492698 - 0.0112) * 2)) - 1;
x(4) = (((X4 - 4.75734170358399) / (23.3319680566546 - 4.75734170358399) * 2)) - 1;

% Initial weights of hidden layers (hidden layer input)
hi(1) = -3.4231 * x(1) - 0.2717 * x(2) - 2.2695 * x(3) + 0.3031 * x(4) + 1.8331;
hi(2) = -0.1368 * x(1) + 0.6516 * x(2) + 0.2927 * x(3) - 0.1352 * x(4) + 0.1379;
hi(3) = 1.791026229 * x(1) + 3.055993801 * x(2) - 0.066695133 * x(3) + 0.178638049 * x(4) - 1.072392688;
hi(4) = -0.099972071 * x(1) + 0.249104512 * x(2) - 0.056109621 * x(3) + 0.574054177 * x(4) - 1.17651779;
hi(5) = -0.2305 * x(1) + 0.3719 * x(2) + 0.4539 * x(3) - 2.0962 * x(4) - 2.9496;

% Output of hidden layer (hidden layer output) using hyperbolic tangent sigmoid
h0(1) = tansig(hi(1));
h0(2) = tansig(hi(2));
h0(3) = tansig(hi(3));
h0(4) = tansig(hi(4));
h0(5) = tansig(hi(5));

% Input of output layer (output layer input)
yi(1) = 0.027413046 * h0(1) + 0.421744461 * h0(2) + 0.203435949 * h0(3) + 2.066123348 * h0(4) + 0.553586224 * h0(5) + 1.93860251943921;

% Output of output layer (output layer output) using linear transfer function
y0(1) = purelin(yi(1));

% Convert output coded value (-1 to +1) back to the actual value of ETR
ETR = (((y0(1) + 1) * (57.5999727426877 - 23.414964293033)) / 2) + 23.414964293033;

% Calculate ethylene permeance (K)
K = ((ETR / 3600) / (0.7853975 * X6 * X6));

end