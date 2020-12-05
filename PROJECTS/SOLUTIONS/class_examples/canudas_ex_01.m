% MOBILE ROBOT FROM CANUDAS
% DIFFERENTIAL ROBOT (2 FIXED WHEELS)
% Santiago Garcia Arango
clc; clear variables;
format short;
% sympref('FloatingPointOutput',true);

% Access upper folder functions
addpath(genpath("../"));


syms r theta l x_d y_d theta_d


% Define each sub-parameter of the wheels
a1 = 0;    % alfa 1
b1 = 0;    % beta 1
l1 = l;    % l1 (distance)
a2 = -pi;  % alfa 2
b2 = 0;    % beta 2
l2 = l;    % l2 (distance)

% Constraints for the first part of the equation
TM = transformation([0, 0, 1], [0, 0, 0], theta, 1);
R_theta = TM(1:3, 1:3)
J1 = [-sin(a1+b1), cos(a1+b1), l*cos(b1);
      -sin(a2+b2), cos(a2+b2), l*cos(b2)]
% MANUAL FIX------------------------------------------------------
J1(2,1) = 0


C1 = [cos(a1+b1), sin(a1+b1), l*sin(b1);
      cos(a2+b2), sin(a2+b2), l*sin(b2)]
% MANUAL FIX------------------------------------------------------
C1(2,2) = 0

 
% Constraints for the second part of equation
J2 = [r, 0; 0, r]
C2 = 0

% Find constraint couple matrix for the general model equation
SIGMA = null(C1)

% D = -C2^(-1)*C1
E = -J2^(-1)*J1


% General models
syms V W

Z_dot = R_theta*SIGMA*[V; W]
% B_dot = D*SIGMA*[V; W]
phi_dot = E*SIGMA*[V; W]

