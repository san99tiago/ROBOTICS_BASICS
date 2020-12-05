% POINT 1: OMNIDIRECTIONAL 7 WHEEL ROBOT (CANUDAS APPROACH)
% SANTIAGO GARCIA ARANGO // ROBOTICS FINAL
clc; clear variables; format short;
addpath(genpath("../"));  % Acces upper folder functions
% sympref('FloatingPointOutput',true);

% Add necessary symbolic variables for the solution
syms theta x_d y_d theta_d Vx Vy W

% Define each sub-parameter of the wheels (alfa, beta, radius, gamma, L)
a1 = pi/6;     b1 = 0;     r1 = 0.03;  gamma1 = 7*pi/36;  l1 = 0.25;
a2 = pi/2;     b2 = 0;     r2 = 0.02;  gamma2 = 0;        l2 = 0.25;
a3 = 5*pi/6;   b3 = 0;     r3 = 0.03;  gamma3 = 7*pi/36;  l3 = 0.25;
a4 = 7*pi/6;   b4 = 0;     r4 = 0.03;  gamma4 = 7*pi/36;  l4 = 0.25;
a5 = 3*pi/2;   b5 = 0;     r5 = 0.02;  gamma5 = 0;        l5 = 0.25;
a6 = 11*pi/6;  b6 = 0;     r6 = 0.03;  gamma6 = 7*pi/36;  l6 = 0.25;
a7 = 0;        b7 = pi/2;  r7 = 0.02;  gamma7 = 0;        l7 = 0;

% Constraints for the second part of equation
J2 = [r1*cos(gamma1), 0, 0, 0, 0, 0, 0;
      0, r2*cos(gamma2), 0, 0, 0, 0, 0;
      0, 0, r3*cos(gamma3), 0, 0, 0, 0;
      0, 0, 0, r4*cos(gamma4), 0, 0, 0;
      0, 0, 0, 0, r5*cos(gamma5), 0, 0;
      0, 0, 0, 0, 0, r6*cos(gamma6), 0;
      0, 0, 0, 0, 0, 0, r7*cos(gamma7)]

% Constraints for the first part of the equation
J1 = [-sin(a1+b1+gamma1), cos(a1+b1+gamma1), l1*cos(b1+gamma1);
      -sin(a2+b2+gamma2), cos(a2+b2+gamma2), l2*cos(b2+gamma2);
      -sin(a3+b3+gamma3), cos(a3+b3+gamma3), l3*cos(b3+gamma3);
      -sin(a4+b4+gamma4), cos(a4+b4+gamma4), l4*cos(b4+gamma4);
      -sin(a5+b5+gamma5), cos(a5+b5+gamma5), l5*cos(b5+gamma5);
      -sin(a6+b6+gamma6), cos(a6+b6+gamma6), l6*cos(b6+gamma6);
      -sin(a7+b7+gamma7), cos(a7+b7+gamma7), l7*cos(b7+gamma7)]
  
% MANUAL FIXES (SMALL NUMBERS)--- This is because they could affect null space-base
J1(2,2) = 0;
J1(5,2) = 0;
J1(7,2) = 0

SIGMA = eye(3)  % Sigma couple matrix doesn't have any restrictions on this model
E = -J2^(-1)*J1
TM = transformation([0, 0, 1], [0, 0, 0], theta, 1);
R_theta = TM(1:3, 1:3);


Z_dot = R_theta*SIGMA*[Vx; Vy; W]
phi_dot = E*SIGMA*[Vx; Vy; W]
