% PART 1 OF LAGRAGIAN EXAMPLE OF "PP" ROBOT
% Santiago Garcia Arango
clc; clear variables;
format short;
sympref('FloatingPointOutput',true);


% Define main symbolic variables for solving the problem
syms d1(t) d2(t) m1 m2 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 g
assume(t, "positive");
assume(d1(t), "positive");
assume(d2(t), "positive");
assume(m1, "positive");
assume(m2, "positive");


% Get the vectors of the position of the center of mass for each arm
Pcm1 = [0; d1]
Pcm2 = [d2; d1]


% Get the vectors of the velocity of the center of mass for each arm
Pcm1_dif = diff(Pcm1, t)
Pcm2_dif = diff(Pcm2, t)

% Get the angular velocities for each arm
w = [0; 0; 0]

% Inertias of eacch robot arm
I1 = [Ixx1, 0, 0; 0, Iyy1, 0; 0, 0, Izz1]
I2 = [Ixx2, 0, 0; 0, Iyy2, 0; 0, 0, Izz2]

% Get kinetic energy of the system
T = 1/2*(m1*Pcm1_dif.'*Pcm1_dif + m2*Pcm2_dif.'*Pcm2_dif + ...
         w.'*I1*w + w.'*I2*w);
fprintf("T:\n");
pretty(simplify(T));

% Get potential energy of the system
U = m1*g*d1 + m2*g*d1

% Get lagrangian representation of the system
L = T - U
fprintf("L:\n");
pretty(simplify(L));
