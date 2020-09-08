% SOLUTION OF OLD QUIZ FROM 2019
% Santiago Garcia Arango
clc; clear variables; format short

% Access upper folder functions
addpath(genpath("../"));


% SECOND EXERCISE
P_f1_f2 = [1, -1, 1]'

R_f1_f2 = (1/3)*[1        , 1-sqrt(3), 1+sqrt(3);
                 1+sqrt(3), 1        , 1-sqrt(3);
                 1-sqrt(3), 1+sqrt(3), 1        ]

P_f1_c = [0, 0, 1]'


P_f2_c = inv(R_f1_f2) * ( P_f1_c - P_f1_f2 )



