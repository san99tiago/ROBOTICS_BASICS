% My solution of problem 2.2 from Craig Robotics
% SANTIAGO GARCIA ARANGO
clc; clear variables;

% Access upper folder functions
addpath(genpath("../"));

% Apply first rotation
TM1 = transformation([0, 1, 0], [0, 0, 0], deg2rad(30));
fprintf("TM1 (45 degrees in Y axis):\n");
disp(TM1)

% Apply second rotation
TM2 = transformation([1, 0, 0], [0, 0, 0], deg2rad(45));
fprintf("TM2 (30 degrees in X axis):\n");
disp(TM2);

fprintf("TM2*TM1:\n");
disp(TM2*TM1);


