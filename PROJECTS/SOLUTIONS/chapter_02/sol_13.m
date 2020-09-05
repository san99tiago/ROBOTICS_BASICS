% My solution of problem 2.13 from Craig Robotics
% SANTIAGO GARCIA ARANGO
clc; clear variables;

% Access upper folder functions
addpath(genpath("../"));

% Tranformation matrix 1
TM_UA = [0.866, -0.500, 0.000, 11;
         0.500,  0.866, 0.000, -1;
         0.000,  0.000, 1.000,  8;
         0.000,  0.000, 0.000,  1];
fprintf("TM_UA:\n");
disp(TM_UA)

% Tranformation matrix 2
TM_BA = [1.000,  0.000,  0.000,   0;
         0.000,  0.866, -0.500,  10;
         0.000,  0.500,  0.866, -20;
         0.000,  0.000,  0.000,   1];
fprintf("TM_UA:\n");
disp(TM_BA)

% Tranformation matrix 3
TM_CU = [0.866, -0.500,  0.000, -3;
         0.433,  0.750, -0.500, -3;
         0.250,  0.433,  0.866,  3;
         0.000,  0.000,  0.000,  1];
fprintf("TM_UA:\n");
disp(TM_CU)


TM_BC = TM_BA * inv(TM_UA) * inv(TM_CU);
fprintf("TM_BC:\n");
disp(TM_BC)
