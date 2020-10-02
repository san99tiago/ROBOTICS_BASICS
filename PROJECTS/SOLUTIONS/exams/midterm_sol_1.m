% SANTIAGO GARCIA ARANGO



format short

% Access upper folder functions
addpath(genpath("../"));


TM_A_B = [1/sqrt(2),    0,  1/sqrt(2), 0;
               -1/2,  1/sqrt(2),  1/2, 0;
               -1/2, -1/sqrt(2), 1/2, 0;
               0,    0,    0,         1]


R_A_B = TM_A_B(1:3,1:3)
           
det(R_A_B)

R_A_B* R_A_B'

[vector_K, angle, Pos] = inv_transformation(TM_A_B)

TM_test_1 = transformation(vector_K, [0, 0, 0], angle) 

[beta, alfa, gamma, Pos] = inv_transformation_zyz(TM_A_B)






