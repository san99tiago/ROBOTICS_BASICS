% SANTIAGO GARCIA ARANGO



format short

% Access upper folder functions
addpath(genpath("../"));


TM_A_B = [0.933, 0.067, 0.354, 0;
          0.067, 0.933, 0.354, 0;
          -0.354, 0.354, 0.866, 1]
      
is_tm_valid(TM_A_B)

R_A_B = TM_A_B(1:3,1:3)
           
det(R_A_B)

R_A_B* R_A_B'




