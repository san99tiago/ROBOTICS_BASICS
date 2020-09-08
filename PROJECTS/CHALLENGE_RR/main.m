% CHALLENGE: DRAW A ROBOTIC RR ARM BETWEEN TWO USER INPUT POINTS
% SANTIAGO GARCIA ARANGO

% Access the point A and point B for the trajectories
x = inputdlg({'X inicial','Y inicial','X final', 'Y final'}, ...
              'Santiago Garcia', [1 50; 1 50; 1 50; 1 50], ...
              {'-10','3','8','5'}); 
          
% Initial and Final Position based on user input
x_inicial = str2double(x{1});
y_inicial = str2double(x{2});
x_final = str2double(x{3});
y_final = str2double(x{4});

% Measurements of L1 and L2
L1 = 8;
L2 = 7;

% Define the amout of points for the vector of point in trajectory
SPEED_POINTS = 300;

[x, y] = find_trajectory("linear", x_inicial, x_final, y_inicial, ...
                        y_final, SPEED_POINTS);

                    
animate_trajectory(x, y, L1, L2, SPEED_POINTS);
