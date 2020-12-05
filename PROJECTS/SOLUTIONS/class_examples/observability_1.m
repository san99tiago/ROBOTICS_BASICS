% OBSERVABILITY ANALISIS FOR CHECKING WHICH SENSOR TO PICK
% Santiago Garcia Arango
clc; clear variables;
format short;
sympref('FloatingPointOutput',true);

% Define the State-Space matrices for the system
% (we must check which "C" matrix to choose)
A = [0, 1; 0, 0];
B = [0;1];
C1 = [-1, 0];
C2 = [1, -1];
C3 = [1, 0];
C4 = [0, 1];

% Now we do an observability analisis
fprintf("\n rank_1(%.0f)\n",rank(obsv(A, C1)))
fprintf("\n rank_2(%.0f)\n",rank(obsv(A, C2)))
fprintf("\n rank_3(%.0f)\n",rank(obsv(A, C3)))
fprintf("\n rank_4(%.0f)\n",rank(obsv(A, C4)))
