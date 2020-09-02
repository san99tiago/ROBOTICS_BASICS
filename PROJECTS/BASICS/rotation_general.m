% ROBOTICS: OBTAIN RESULTING R_XYZ MATRIX WITH RX, RY, RZ
% SANTIAGO GARCIA ARANGO
clear

syms gama beta alfa

RX = [1, 0, 0; 0, cos(gama), -sin(gama); 0, sin(gama), cos(gama)]
RY = [cos(beta), 0, sin(beta); 0, 1, 0; -sin(beta), 0, cos(beta)]
RZ = [cos(alfa), -sin(alfa), 0; sin(alfa), cos(alfa), 0; 0, 0, 1]

RXYZ = RZ*RY*RX
