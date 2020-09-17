% FIND_TRAJECTORY: find resulting trajectory inbetween two points
% SANTIAGO GARCIA ARANGO


function [x, y] = find_trajectory(trajectory_type, x_inicial, x_final,...
                                    y_inicial, y_final, time)

    if trajectory_type == "linear"
        % Find line equation of the robot
        m = (y_final - y_inicial)/(x_final - x_inicial);
        b = y_final - m*x_final;

        % Generate the vectors for each point of the robot movement
        x = linspace(x_inicial, x_final, time);
        y = m*x + b;
    end

    
    if trajectory_type == "5th"
        % Use input parameters for the variables needed
        x_o = x_inicial;
        y_o = y_inicial;
        x_f = x_final;
        y_f = y_final;

        % Define the intitial conditions for the fifth order trajectory    
        x_d_o = 0;
        y_d_o = 0;
        x_d_f = 0;
        y_d_f = 0;
        x_dd_o = 0;
        y_dd_o = 0;
        x_dd_f = 0;
        y_dd_f = 0;
        
        tf = time;
        
        % Apply constants for the fifth order trajectories (see Craig book)
        a0_x = x_o;
        a1_x = x_d_o;
        a2_x = x_dd_o/2;
        a3_x = (20*x_f - 20*x_o - (8*x_d_f + 12*x_d_o)*tf - (3*x_dd_o - x_dd_f)*tf^2)/(2*tf^3);
        a4_x = (30*x_o - 30*x_f + (14*x_d_f + 16*x_d_o)*tf + (3*x_dd_o - 2*x_dd_f)*tf^2)/(2*tf^4);
        a5_x = (12*x_f - 12*x_o - (6*x_d_f + 6*x_d_o)*tf - (x_dd_o - x_dd_f)*tf^2)/(2*tf^5);
        
        a0_y = y_o;
        a1_y = y_d_o;
        a2_y = y_dd_o/2;
        a3_y = (20*y_f - 20*y_o - (8*y_d_f + 12*y_d_o)*tf - (3*y_dd_o - y_dd_f)*tf^2)/(2*tf^3);
        a4_y = (30*y_o - 30*y_f + (14*y_d_f + 16*y_d_o)*tf + (3*y_dd_o - 2*y_dd_f)*tf^2)/(2*tf^4);
        a5_y = (12*y_f - 12*y_o - (6*y_d_f + 6*y_d_o)*tf - (y_dd_o - y_dd_f)*tf^2)/(2*tf^5);
    
        % Generate the vectors for each point of the robot movement
        t = linspace(x_o, x_f, time);
        x = zeros(1, size(t, 2));
        y = zeros(1, size(t, 2));
        
        
    end

    
    
end

