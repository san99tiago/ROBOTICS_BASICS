% TEST DH PARAMETERS TABLE FOR AN "R-R-R" ROBOT
% Santiago Garcia Arango

% Access upper folder functions
addpath(genpath("../"));

% Define Symbolic variables and assume they are real (avoid "complex")
syms theta1 L1 theta2 L2 theta3 L3
assume(theta1, "positive")
assume(L1, "positive")
assume(theta2, "positive")
assume(L2, "positive")
assume(theta3, "positive")
assume(L3, "positive")

% Define DH table of parameters
DH_TABLE = [0,  0, 0, theta1;
            0, L1, 0, theta2;
            0, L2, 0, theta3;
            0, L3, 0, 0]

% Main functions to obtain TM and values for position and rotation
[TM, cell_of_TM] = denavit_hartenberg(DH_TABLE);
[vector_K, angle, P] = inv_transformation(TM);


% We show the simplified version of final TM, position and rotation
% "simplify" lets us show the simplest version of symbolic expression
TM = simplify(TM, 'IgnoreAnalyticConstraints', true)
vector_K = simplify(vector_K, 'IgnoreAnalyticConstraints',true)
angle = simplify(angle,'IgnoreAnalyticConstraints',true)
P = simplify(P,'IgnoreAnalyticConstraints',true)

