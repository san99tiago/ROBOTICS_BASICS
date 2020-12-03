% TEST DH PARAMETERS TABLE FOR AN "R-R-P" ROBOT
% Santiago Garcia Arango

% Access upper folder functions
addpath(genpath("../"));

% Define Symbolic variables and assume they are real (avoid "complex")
syms theta1 q1 q2 q3 L1
assume(q1, "positive")
assume(q2, "positive")
assume(q3, "positive")
assume(L1, "positive")


% Define DH table of parameters
DH_TABLE = [   0,  0, L1, pi/2 + q1;
            pi/2,  0,  0, pi/2 + q2;
            pi/2,  0, q3,         0;
                0, 0,  0,         0]

% Main functions to obtain TM and values for position and rotation
[TM, cell_of_TM] = denavit_hartenberg(DH_TABLE, 1);


% We show the simplified version of final TM, position and rotation
% "simplify" lets us show the simplest version of symbolic expression
TM = simplify(TM, 'IgnoreAnalyticConstraints', true)

