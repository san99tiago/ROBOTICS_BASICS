% ANIMATE_TRAJECTORY: script to animate a trajectory from two vectors
% SANTIAGO GARCIA ARANGO
% ------------------------------------------------------------------------
% Parameters:
% --> x: vector of all "x" positions of the vector
% --> y: vector of all "y" positions of the vector
% --> SPEED_POINTS: number of points to track
% --> L1: length of first robot arm
% --> L2: lenght of second robot arm

function [] = animate_trajectory(x, y, L1, L2, SPEED_POINTS)
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
        pretty_figure("EL MEJOR ROBOT RR");

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


end

