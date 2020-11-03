% PART 1 OF LAGRAGIAN EXAMPLE OF "RR" ROBOT
% Santiago Garcia Arango
clc; clear variables;
format short;
sympref('FloatingPointOutput',true);


% Define main symbolic variables for solving the problem
syms L1 L2 theta1(t) theta2(t) m1 m2 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 g
assume(t, "positive");
assume(theta1(t), "positive");
assume(theta2(t), "positive");
assume(L1, "positive");
assume(L2, "positive");
assume(m1, "positive");
assume(m2, "positive");

% Get the vectors of the position of the center of mass for each arm
Pcm1 = [L1*cos(theta1); L1*sin(theta1)]
Pcm2 = [L1*cos(theta1) + L2*cos(theta1+theta2); L1*sin(theta1) + L2*sin(theta1+theta2)]

% Get the vectors of the velocity of the center of mass for each arm
Pcm1_dif = collect(diff(Pcm1, t), diff(theta1))
Pcm2_dif = collect(diff(Pcm2, t), diff(theta1))

% Get the angular velocities for each arm
w1 = [0; 0; diff(theta1, t)]
w2 = [0; 0; diff(theta1+theta2,t)]

% Inertias of eacch robot arm
I1 = [Ixx1, 0, 0; 0, Iyy1, 0; 0, 0, Izz1]
I2 = [Ixx2, 0, 0; 0, Iyy2, 0; 0, 0, Izz2]

% Get kinetic energy of the system
T = 1/2*(m1*Pcm1_dif.'*Pcm1_dif + m2*Pcm2_dif.'*Pcm2_dif + ...
         w1.'*I1*w1 + w2.'*I2*w2);
fprintf("T:\n");
pretty(simplify(T));

% Get potential energy of the system
U = m1*g*L1*sin(theta1) + m2*g*(L1*sin(theta1)+L2*sin(theta1+theta2))

% Get lagrangian representation of the system
L = T - U
fprintf("L:\n");
pretty(collect(simplify(L), diff(theta1)^2));
