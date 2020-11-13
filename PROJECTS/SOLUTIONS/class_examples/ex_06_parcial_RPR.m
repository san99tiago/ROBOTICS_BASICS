% TEST DH PARAMETERS TABLE FOR AN "R-P-R" ROBOT
% Santiago Garcia Arango

% Access upper folder functions
addpath(genpath("../"));

% Define Symbolic variables and assume they are real (avoid "complex")
syms q1 q2 theta3 L1 L2 L3
assume(q1, "positive")
assume(q2, "positive")
assume(theta3, "positive")
assume(L1, "positive")
assume(L2, "positive")
assume(L3, "positive")


% Define DH table of parameters
DH_TABLE = [   0,  0,       0,      pi/2 + q1;
            pi/2, L1, L2 + q2,             pi;
            pi/2,  0,       0, -pi/2 + theta3;
            pi/2,  0,      L3,              0]

% Main functions to obtain TM and values for position and rotation
[TM, cell_of_TM] = denavit_hartenberg(DH_TABLE);


% We show the simplified version of final TM, position and rotation
% "simplify" lets us show the simplest version of symbolic expression
TM = simplify(TM, 'IgnoreAnalyticConstraints', true)

