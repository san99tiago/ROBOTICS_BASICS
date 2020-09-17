% SOLUTION OF QUIZ 1 POINT 1 ROBOTICS
% SANTIAGO GARCIA ARANGO
clc; clear variables;


TM_AAprima = transformation([0, 0, 0], [3, 4, 10], 0, 0)


TM_AprimaAprimaprima = transformation([1, 1, 3], [0, 0, 0], deg2rad(40))


TM_AprimaprimaB = transformation([0, 0, 0], -[-4, 6, 7], 0, 0)


TM_AB = TM_AAprima * TM_AprimaAprimaprima * TM_AprimaprimaB

TM_BA = inv(TM_AB)