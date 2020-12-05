% POINT 3 SOLUTION
% Santiago Garcia Arango
clc; clear variables;
syms x y L phi

x_prime = simplify(x + L*cos(phi+pi/2))
y_pime = simplify(y + L*sin(phi+pi/2))

R = ([cos(phi), -cos(phi); sin(phi), -sin(phi)])

det_R = det(R)