% PART 1 OF LAGRAGIAN EXAMPLE OF "RPP" ROBOT
% Santiago Garcia Arango
clc; clear variables;
format short;
sympref('FloatingPointOutput',true);

% Define main symbolic variables for solving the problem
syms L1 theta1(t) d2(t) d3(t)  m1 m2 m3 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 g
assume(t, "positive");
assume(L1, "positive");
assume(theta1(t), "positive");
assume(d2(t), "positive");
assume(d3(t), "positive");
assume(m1, "positive");
assume(m2, "positive");
assume(m3, "positive");


% Get the vectors of the position of the center of mass for each arm
Pcm1 = [0; 0; L1]
Pcm2 = [d2*cos(theta1); d2*sin(theta1); L1]
Pcm3 = [d2*cos(theta1); d2*sin(theta1); L1-d3]

% Get the vectors of the velocity of the center of mass for each arm
Pcm1_dif = diff(Pcm1, t)
Pcm2_dif = diff(Pcm2, t)
Pcm3_dif = diff(Pcm3, t)

% Get the angular velocities for each arm
w1 = [0; 0; diff(theta1, t)]
w2 = [0; 0; diff(theta1, t)]
w3 = [0; 0; diff(theta1, t)]

% Inertias of eacch robot arm
I1 = [Ixx1, 0, 0; 0, Iyy1, 0; 0, 0, Izz1]
I2 = [Ixx2, 0, 0; 0, Iyy2, 0; 0, 0, Izz2]
I3 = [Ixx3, 0, 0; 0, Iyy3, 0; 0, 0, Izz3]

% Get kinetic energy of the system
T = 1/2*(m1*Pcm1_dif.'*Pcm1_dif + m2*Pcm2_dif.'*Pcm2_dif + m3*Pcm3_dif.'*Pcm3_dif +...
         w1.'*I1*w1 + w2.'*I2*w2 + w3.'*I3*w3);
fprintf("T:\n");
pretty(simplify(T));

% Get potential energy of the system
U = m1*g*L1 + m2*g*L1 + m3*g*(L1-d3)

% Get lagrangian representation of the system
L = T - U
fprintf("L:\n");
pretty(simplify(L));
