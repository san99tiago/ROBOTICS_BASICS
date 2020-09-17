% CHALLENGE: DRAW A ROBOTIC RR ARM BETWEEN TWO USER INPUT POINTS
% SANTIAGO GARCIA ARANGO

% Access the point A and point B for the trajectories
x = inputdlg({'X inicial','Y inicial','X final', 'Y final'}, ...
              'Santiago Garcia', [1 50; 1 50; 1 50; 1 50], ...
              {'5','4','5','-4'}); 
          
% Initial and Final Position based on user input
x_inicial = str2double(x{1});
y_inicial = str2double(x{2});
x_final = str2double(x{3});
y_final = str2double(x{4});

% Measurements of L1 and L2
L1 = 6;
L2 = 4;

% Define the amout of points for the vector of point in trajectory
TIME = 10;

[t, x, y, vel_x, vel_y, ace_x, ace_y] = find_trajectory("5th", ...
                    x_inicial, x_final, y_inicial, y_final, TIME);

                    
animate_trajectory(x, y, L1, L2);


graph_positions(t, x, y);
graph_velocities(t, vel_x, vel_y);
graph_acelerations(t, ace_x, ace_y);


