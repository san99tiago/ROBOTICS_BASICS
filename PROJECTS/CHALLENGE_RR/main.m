% CHALLENGE: DRAW A ROBOTIC RR ARM AND DO THE TCD AND TCI 
% SANTIAGO GARCIA ARANGO

% Access the point A and point B for the trajectories
x = inputdlg({'X inicial','Y inicial','X final', 'Y final'}, ...
              'Santiago Garcia', [1 50; 1 50; 1 50; 1 50], ...
              {'-10','3','8','5'}); 
          
% Initial and Final Position
x_inicial = str2double(x{1});
y_inicial = str2double(x{2});

x_final = str2double(x{3});
y_final = str2double(x{4});

% Measurements of L1 and L2
L1 = 8;
L2 = 7;

SPEED_POINTS = 300;

% Find line equation of the robot
m = (y_final - y_inicial)/(x_final - x_inicial);
b = y_final - m*x_final;

% Generate the vectors for each point of the robot movement
x = linspace(x_inicial, x_final, SPEED_POINTS);
y = m*x + b;


% Start the figure animation
figure(1)

% Plot main line to follow
plot(x,y, "r", "LineWidth", 0.2);

% Button to exit if needed
EXIT = uicontrol('Style', 'PushButton', ...
                    'String', 'SALIRSE', ...
                    'Callback', 'delete(gcbf)');

for i=1:SPEED_POINTS
    gamma = atan2(y(i), x(i));
    LT = sqrt(x(i)^2 + y(i)^2);
    alfa = acos((LT^2 + L1^2 - L2^2)/(2*L1*LT));
    theta_1 = gamma - alfa;


    b1_x = [0, L1*cos(theta_1)];
    b1_y = [0, L1*sin(theta_1)];
    b2_x = [b1_x(2), x(i)];
    b2_y = [b1_y(2), y(i)];


    b1 = line(b1_x, b1_y, "LineWidth", 2);
    b2 = line(b2_x, b2_y, "LineWidth", 2);

    xlim([-10, 10]);
    ylim([-10, 10]);
    GRAFICA_BONITA("EL MEJOR ROBOT RR");

    pause(1/1000);

    % Allows us to keep showing robot arm at the last point
    if i ~= SPEED_POINTS
        delete(b1);
        delete(b2);
    end
    
    % When the exit button is pressed, lets us break the cycle
    if not(ishandle(EXIT))
        break
    end
end
