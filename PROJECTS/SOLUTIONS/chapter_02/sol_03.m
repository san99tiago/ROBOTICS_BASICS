% My solution of problem 2.3 from Craig Robotics
% SANTIAGO GARCIA ARANGO
clc; clear variables;

% Access upper folder functions
addpath(genpath("../"));

% Define symbolic variables
syms theta phi

% Apply first rotation
TM1 = transformation([0, 0, 1], [0, 0, 0], theta);
fprintf("TM1 (45 degrees in Y axis):\n");
disp(TM1)

% Apply second rotation
TM2 = transformation([1, 0, 0], [0, 0, 0], phi);
fprintf("TM2 (30 degrees in X axis):\n");
disp(TM2);

% Remember that this is Euler angles
fprintf("TM1*TM2:\n");
disp(TM1*TM2);
