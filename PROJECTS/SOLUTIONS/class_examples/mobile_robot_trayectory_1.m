% SOLUTION OF MOBILE ROBOT TRAJECTORY PROBLEM
% DIFFERENTIAL ROBOT EXAMPLE
% Santiago Garcia Arango
% ----------------------------------------------------------
clc; clear variables;
format short;

% Access upper folder functions
addpath(genpath("../"));


% FIRST TRAJECTORY
VL = 0.3;       % Left velocity [m/s]
VR = 0.3;       % Rigth velocity [m/s]
tf = 3;         % Total time for trajectory [s]
x0 = 1.5;       % Initial conditions in x [m]
y0 = 2.0;       % Initial conditions in y [m]
theta0 = pi/2;  % Initial conditions in theta [rad]

[x1, y1, theta1] = FindMobileRobotTrajectory(VL, VR, tf, x0, y0, theta0);


% SECOND TRAJECTORY
VL = 0.1;       % Left velocity [m/s]
VR = -0.1;      % Rigth velocity [m/s]
tf = 1;         % Total time for trajectory [s]

[x2, y2, theta2] = FindMobileRobotTrajectory(VL, VR, tf, ...
                        x1(length(x1)), y1(length(y1)), theta1(length(theta1)));

% THIRD TRAJECTORY
VL = 0.2;       % Left velocity [m/s]
VR = 0.0;       % Rigth velocity [m/s]
tf = 2;         % Total time for trajectory [s]

[x3, y3, theta3] = FindMobileRobotTrajectory(VL, VR, tf, ...
                        x2(length(x2)), y2(length(y2)), theta2(length(theta2)));

% PLOT RESULTS
figure();
plot(x1,y1,x2,y2,x3,y3, "LineWidth",2);
grid on;
xlabel("X DISTANCE [m]");
ylabel("Y DISTANCE [m]");


function [vector_x, vector_y, vector_theta] = FindMobileRobotTrajectory(VL, VR, tf, x0, y0, theta0)
% FIND MOBILE ROBOT TRAJECTORY
% VL                 --> Left wheel cm speed [m/s]
% VR                 --> Right wheel cm speed [m/s]
% tf                 --> Total time for the trajectorie [s]
% initial_conditions --> x0, y0, theta0 [size(3x1)]


% Main robot distances (given by the exercise)
L = 0.5;    % Distance inbetween wheels[m]
% R = 0.05;  % Radius of the wheels [m]

% Variables to make discrete time approach
TOTAL_POINTS = 1000;
delta_t = tf/TOTAL_POINTS;

% Define vectors for getting all positions of the robot
vector_x = [x0];
vector_y = [y0];
vector_theta = [theta0];

% Get vectors for every x, y and theta position in trajectory ("+1" to correct size)
for i=2:TOTAL_POINTS + 1
    % Find specific distances for left and right wheels
    DR = VR*delta_t;
    DL = VL*delta_t;
    
    % Find average distance for the robot (using both wheels speed)
    DC = (DR + DL)/2;
    
    
    % Find specific theta, x and y at each "step" of the robot
    vector_x(i) =  vector_x(i-1) + DC*cos(vector_theta(i-1));
    vector_y(i) = vector_y(i-1) + DC*sin(vector_theta(i-1));
    vector_theta(i) = vector_theta(i-1) + (DR - DL)/L;
end

end
