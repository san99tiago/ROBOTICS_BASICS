% SIMPLE SCRIPT TO DO SOME TEST FOR OTHER FUNCTIONS WITH TM
% SANTIAGO GARCIA ARANGO
clc; clear variables; format short

% Access upper folder functions
addpath(genpath("../"));

% ----------------TEST TM WITH FIXED ANGLES APPROACH----------------------
x_angle = 0.1
y_angle = 0.2
z_angle = 0.3
P_vector = [3, 4, 5]

% Get TM_A with fixed angles approach
TM_A = transformation([0, 0, 0], P_vector, 0);
TM_A = TM_A * transformation([0, 0, 1], [0, 0, 0], z_angle);
TM_A = TM_A * transformation([0, 1, 0], [0, 0, 0], y_angle);
TM_A = TM_A * transformation([1, 0, 0], [0, 0, 0], x_angle)

% Check if the values from the TM and fixed angles are okay
[x_angle_found, y_angle_found, z_angle_found, P_vector_found_1] = ...
                                inv_transformation_fixed_angles(TM_A)

                            
% ----------------TEST TM WITH K VECTOR APPROACH----------------------
K_vector = [1, 2, 3]
angle = 0.5
P_vector = [3, 4, 5]

% Generate TM matrix from inputs
TM_B = transformation(K_vector, P_vector, angle)

% Check if the values from the TM and K_vector found are okay
[K_vector_found, angle_found, P_vector_found_2] = inv_transformation(TM_B)


