% FIND_TRAJECTORY: find resulting trajectory inbetween two points
% Santiago Garcia y Elkin Guerra
% This scripts generates a trajectory, for any inputs variables


function [t, var, vel_var, ace_var] = QUIZ_2_TRAYECTORIAS(...
                            var_inicial, var_final, final_time, type)

if type == "1"
    % Use input parameters for the variables needed
    var_o = var_inicial;
    var_f = var_final;

    % Define the intitial conditions for the fifth order trajectory    
    var_d_o = 0; % GARANTIZAR VELOCIDAD INICIAL CERO
    var_d_f = 3.49;

    var_dd_o = 0;
    var_dd_f = 0;

    tf = final_time;

    % Apply constants for the fifth order trajectories (see Craig book)
    a0 = var_o
    a1 = var_d_o
    a2 = (3/tf^2)*(var_f - var_o) - (2/tf)*(var_d_o) - (1/tf)*var_d_f
    a3 = -(2/tf^3)*(var_f - var_o) + (1/tf^2)*(var_d_f + var_d_o)


 


    % Initialize the vectors for the important variables of the robot
    t = linspace(0, tf, 250);

    var = zeros(1, size(t, 2));        
    vel_var = zeros(1, size(t, 2));
    ace_var = zeros(1, size(t, 2));


    % Generate main position vectors based on the constants found
    for i=1: size(t,2)
        var(i) = a0 + a1*t(i) + a2*(t(i))^2 + a3*(t(i))^3;
    end

    % Generate main velocity vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical derivatives for trajectories
        vel_var(i) = a1 + 2*a2*t(i) + 3*a3*(t(i))^2;
    end     

    % Generate main aceleration vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical second derivatives for trajectories
        ace_var(i) = 2*a2 + 6*a3*t(i);
    end           
end

if type == "2"
    % Use input parameters for the variables needed
    var_o = var_inicial;
    var_f = var_final;

    % Define the intitial conditions for the fifth order trajectory    
    var_d_o = 0.01;
    var_d_f = 0.01;

    var_dd_o = 0;
    var_dd_f = 0;

    tf = final_time;

    % Apply constants for the fifth order trajectories (see Craig book)
    a0 = var_o;
    a1 = var_d_o;
    a2 = var_dd_o/2;
    a3 = (20*var_f - 20*var_o - (8*var_d_f + 12*var_d_o)*tf - (3*var_dd_o - var_dd_f)*tf^2)/(2*tf^3);
    a4 = (30*var_o - 30*var_f + (14*var_d_f + 16*var_d_o)*tf + (3*var_dd_o - 2*var_dd_f)*tf^2)/(2*tf^4);
    a5 = (12*var_f - 12*var_o - (6*var_d_f + 6*var_d_o)*tf - (var_dd_o - var_dd_f)*tf^2)/(2*tf^5);


    % Initialize the vectors for the important variables of the robot
    t = linspace(0, tf, 250);

    var = zeros(1, size(t, 2));        
    vel_var = zeros(1, size(t, 2));
    ace_var = zeros(1, size(t, 2));


    % Generate main position vectors based on the constants found
    for i=1: size(t,2)
        var(i) = a0 + a1*t(i) + a2*(t(i))^2 + a3*(t(i))^3 + a4*(t(i))^4 + a5*(t(i))^5;
    end

    % Generate main velocity vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical derivatives for trajectories
        vel_var(i) = a1 + 2*a2*t(i) + 3*a3*(t(i))^2 + 4*a4*(t(i))^3 + 5*a5*(t(i))^4;
    end     

    % Generate main aceleration vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical second derivatives for trajectories
        ace_var(i) = 2*a2 + 6*a3*t(i) + 12*a4*(t(i))^2 + 20*a5*(t(i))^3;
    end           
end

if type == "3"
    % Use input parameters for the variables needed
    var_o = var_inicial;
    var_f = var_final;

    % Define the intitial conditions for the fifth order trajectory    
    var_d_o = 0.01;
    var_d_f = 0.01;

    var_dd_o = 0;
    var_dd_f = 0;

    tf = final_time;

    % Apply constants for the fifth order trajectories (see Craig book)
    a0 = var_o;
    a1 = var_d_o;
    a2 = var_dd_o/2;
    a3 = (20*var_f - 20*var_o - (8*var_d_f + 12*var_d_o)*tf - (3*var_dd_o - var_dd_f)*tf^2)/(2*tf^3);
    a4 = (30*var_o - 30*var_f + (14*var_d_f + 16*var_d_o)*tf + (3*var_dd_o - 2*var_dd_f)*tf^2)/(2*tf^4);
    a5 = (12*var_f - 12*var_o - (6*var_d_f + 6*var_d_o)*tf - (var_dd_o - var_dd_f)*tf^2)/(2*tf^5);


    % Initialize the vectors for the important variables of the robot
    t = linspace(0, tf, 250);

    var = zeros(1, size(t, 2));        
    vel_var = zeros(1, size(t, 2));
    ace_var = zeros(1, size(t, 2));


    % Generate main position vectors based on the constants found
    for i=1: size(t,2)
        var(i) = a0 + a1*t(i) + a2*(t(i))^2 + a3*(t(i))^3 + a4*(t(i))^4 + a5*(t(i))^5;
    end

    % Generate main velocity vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical derivatives for trajectories
        vel_var(i) = a1 + 2*a2*t(i) + 3*a3*(t(i))^2 + 4*a4*(t(i))^3 + 5*a5*(t(i))^4;
    end     

    % Generate main aceleration vectors based on the constants found
    for i=1: size(t, 2)
        % This are the mathematical second derivatives for trajectories
        ace_var(i) = 2*a2 + 6*a3*t(i) + 12*a4*(t(i))^2 + 20*a5*(t(i))^3;
    end           
end
        
end

