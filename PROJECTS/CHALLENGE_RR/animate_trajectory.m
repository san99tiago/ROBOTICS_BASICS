% ANIMATE_TRAJECTORY: script to animate a trajectory from two vectors
% SANTIAGO GARCIA ARANGO
% ------------------------------------------------------------------------
% Parameters:
% --> x: vector of all "x" positions of the vector
% --> y: vector of all "y" positions of the vector
% --> L1: length of first robot arm
% --> L2: lenght of second robot arm

function [] = animate_trajectory(x, y, L1, L2)
    % Start the figure animation
    figure(1)
    
    % Create a circle for the R.O.I (maximum one)
    r = L1 + L2;
    x_origin =0;
    y_origin=0;
    theta = linspace(0,2*pi,100);
    plot(x_origin + r*cos(theta),y_origin + r*sin(theta), 'r.');
    hold on 
    

    % Plot main line to follow
    plot(x,y, "r", "LineWidth", 0.2);
    hold on

    % Button to exit if needed
    EXIT = uicontrol('Style', 'PushButton', ...
                        'String', 'CLOSE ALL FIGURES', ...
                        'Callback', 'close all');

    % Get amount of points to be plotted
    POINTS = size(x, 2);

    % Main loop to plot the trajectory based on Inverse Kinematics
    for i=1:POINTS
       
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
        pretty_figure("SANTIAGO GARCIA'S ROBOT ARM");

        pause(1/1000);

        % Allows us to keep showing robot arm at the last point
        if i ~= POINTS
            delete(b1);
            delete(b2);
        end

        % When the exit button is pressed, lets us break the cycle
        if not(ishandle(EXIT))
            close all;
            break
        end
    end


end

