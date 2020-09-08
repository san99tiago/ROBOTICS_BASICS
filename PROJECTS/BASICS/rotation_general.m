% ROBOTICS: GET ROTATION MATRIX FROM FIXED AND RELATIVE ANGLES
% SANTIAGO GARCIA ARANGO
clear variables; clc;

syms gama beta alfa

% Main three rotations
RX = [1, 0, 0; 0, cos(gama), -sin(gama); 0, sin(gama), cos(gama)]
RY = [cos(beta), 0, sin(beta); 0, 1, 0; -sin(beta), 0, cos(beta)]
RZ = [cos(alfa), -sin(alfa), 0; sin(alfa), cos(alfa), 0; 0, 0, 1]

% Fixed angles
RXYZ = RZ*RY*RX

% Euler angles
RXYZ = RX*RY*RZ
