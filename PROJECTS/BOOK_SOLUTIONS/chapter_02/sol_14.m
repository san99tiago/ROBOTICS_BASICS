% My solution of problem 2.14 from Craig Robotics
% SANTIAGO GARCIA ARANGO
clc; clear variables;

% Access upper folder functions
addpath(genpath("../"));

% Define symbolic variables to make the general equation
syms Px Py Pz theta kx ky kz
assume(Px, "real")
assume(Py, "real")
assume(Pz, "real")

% Transformation to translate to point where vector K_unit is
TM_AAprima = transformation([0, 0, 0], [Px, Py, Pz], 0, 1);
fprintf("TM_AAprima:\n")
disp(TM_AAprima)

% Rotation about K_unit
TM_AprimaBprima = transformation([kx, ky, kz], [0, 0, 0], theta, 1);
fprintf("TM_AprimaBprima:\n")
disp(TM_AprimaBprima)

% Translation with negative values of original transformation (return back)
TM_BprimaB = transformation([0, 0, 0], [-Px, -Py, -Pz], 0, 1);
fprintf("TM_BprimaB:\n")
disp(TM_BprimaB)

TM_AB = TM_AAprima * TM_AprimaBprima * TM_BprimaB;
fprintf("TM_AB:\n")
disp(TM_AB)

fid = fopen('myfile.txt', 'w');
for i=1:4
    for j=1:4
        fwrite(fid, char(TM_AB(i,j)), 'char');
    end
end
fclose(fid);
