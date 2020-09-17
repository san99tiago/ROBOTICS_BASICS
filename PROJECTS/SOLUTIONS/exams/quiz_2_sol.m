% SOLUTION OF QUIZ 1 ROBOTICS POINT 2
% SANTIAGO GARCIA ARANGO
clc; clear variables;

% Define Symbolic variables and assume they are real (avoid "complex")
syms d1 L1 theta2 L2
assume(d1, "positive")
assume(L1, "positive")
assume(theta2, "positive")
assume(L2, "positive")


DH_general= [pi/2, 0, L1+d1, pi; pi/2, 0, 0, pi+theta2]

[TM_general_02_, TM_vector] = denavit_hartenberg(DH_general)

fprintf("SOLUCION NUMERAL B:\n\n")

P_2_T = [3, 1, 2, 1]'

L1 = 0
L2 = 0
d1 = 0.2
theta2 = deg2rad(45)

DH= [pi/2, 0, L1+d1, pi; pi/2, 0, 0, pi+theta2]

[TM_02_especifica, TM_vector] = denavit_hartenberg(DH)

P_0_T = TM_02_especifica*P_2_T

[vector_k, angle] = inv_transformation(TM_02_especifica)








