% FIND_TRAJECTORY: find resulting trajectory inbetween two points
% SANTIAGO GARCIA ARANGO


function [x, y] = find_trajectory(trajectory_type, x_inicial, x_final,...
                                    y_inicial, y_final, SPEED_POINTS)

    if trajectory_type == "linear"
        % Find line equation of the robot
        m = (y_final - y_inicial)/(x_final - x_inicial);
        b = y_final - m*x_final;

        % Generate the vectors for each point of the robot movement
        x = linspace(x_inicial, x_final, SPEED_POINTS);
        y = m*x + b;
    end

    
    if trajectory_type == "5th"
        % Define the intitial conditions for the fifth order trajectory
        x_0 = 0;
        y_0 = 0;
        % MUST FINISH
    end

    
    
end

