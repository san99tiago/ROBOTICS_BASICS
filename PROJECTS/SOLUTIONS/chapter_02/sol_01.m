% My solution of problem 2.1 from Craig Robotics
% SANTIAGO GARCIA ARANGO


% Access upper folder functions
addpath(genpath("../"));

% Define our symbolic variables to check answers
syms theta phi

% Apply first rotation
TM1 = transformation([0, 0, 1], [0, 0, 0], theta, 1);
fprintf("First Transformation (theta degrees in Z axis):\n");
disp(TM1)

% Apply second rotation
TM2 = transformation([1, 0, 0], [0, 0, 0], phi, 1);
fprintf("Second Transformation (phi degrees in X axis):\n");
disp(TM2);

fprintf("TM2*TM1:\n");
disp(TM2*TM1);


