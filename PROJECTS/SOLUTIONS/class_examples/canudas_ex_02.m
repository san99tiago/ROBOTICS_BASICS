% MOBILE ROBOT FROM CANUDAS
% OMNIDIRECTIONAL ROBOT (3 SWEDISH WHEELS AT 90 DEGREES WITHOUT ANGLE)
% Santiago Garcia Arango
clc; clear variables;
format short
sympref('FloatingPointOutput',true);

% Access upper folder functions
addpath(genpath("../"));


syms r theta L x_d y_d theta_d


% Define each sub-parameter of the wheels
a1 = pi/3;   % alfa 1
b1 = 0;      % beta 1
r1 = r;      % radio 1
gamma1 = 0;  % swedish angle 1
l1 = L;      % l1 (distance)

a2 = pi;     % alfa 2
b2 = 0;      % beta 2
r2 = r;      % radio 2
gamma2 = 0;  % swedish angle 2
l2 = L;      % l2 (distance)

a3 = 5*pi/3; % alfa 3
b3 = 0;      % beta 3
r3 = r;      % radio 3
gamma3 = 0;  % swedish angle 3
l3 = L;      % l3 (distance)


% Constraints for the first part of the equation
TM = transformation([0, 0, 1], [0, 0, 0], theta, 1);
R_theta = TM(1:3, 1:3)

J1 = [-sin(a1+b1+gamma1), cos(a1+b1+gamma1), L*cos(b1+gamma1);
      -sin(a2+b2+gamma2), cos(a2+b2+gamma2), L*cos(b2+gamma2);
      -sin(a3+b3+gamma3), cos(a3+b3+gamma3), L*cos(b3+gamma3)]
% MANUAL FIX (SMALL NUMBER)------------------------------------------------------
J1(2,1) = 0
C1 = 0
 
% Constraints for the second part of equation
J2 = [r*cos(gamma1), 0, 0; 0, r*cos(gamma2), 0; 0, 0, r*cos(gamma3)]
C2 = 0

% Find constraint couple matrix for the general model equation
SIGMA = eye(3)

% D = -C2^(-1)*C1
E = -J2^(-1)*J1


% General models
syms Vx Vy W

Z_dot = R_theta*SIGMA*[Vx; Vy; W]
% B_dot = D*SIGMA*[Vx; Vy; W]
phi_dot = E*SIGMA*[Vx; Vy; W]

