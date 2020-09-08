% My solution of problem 3.9 from Craig Robotics
% Santiago Garcia Arango
clc; clear variables;

% Access upper folder functions
addpath(genpath("../"));

% Define Symbolic variables and assume they are real (avoid "complex")
syms theta1 L1 theta2 L2 
assume(theta1, "positive")
assume(L1, "positive")
assume(theta2, "positive")
assume(L2, "positive")


% Define DH table of parameters
DH_TABLE = [0   ,  0, 0, theta1;
            pi/2, L1, 0, theta2]

% Main functions to obtain TM and values for position and rotation
[TM_0_2, cell_of_TM] = denavit_hartenberg(DH_TABLE);

TM_0_2 = simplify(TM_0_2, 'IgnoreAnalyticConstraints', true)

P_2_tip = [L2, 0, 0, 1]'

P_0_tip = TM_0_2 * P_2_tip
