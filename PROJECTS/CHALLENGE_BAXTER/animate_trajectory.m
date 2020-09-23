% ANIMATE_TRAJECTORY: script to animate a trajectories of baxter robot
% SANTIAGO GARCIA ARANGO
% ------------------------------------------------------------------------
% Parameters:
% --> POS_1: X, Y, Z positions of left arm
% --> ANG_1: X, Y, Z angles of left arm
% --> POS_2: X, Y, Z positions of right arm
% --> ANG_2: X, Y, Z angles of right arm


function [] = animate_trajectory(POS_1, ANG_1, POS_2, ANG_2)
    
    % Start the figure animation
    figure(1)
    
    % Main distances of Baxter robot (remember that L5=0 for inverse)
    L0 = 0.27035;
    L1 = 0.069;
    L2 = 0.36435;
    L3 = 0.069;
    L4 = 0.37429;
    L5 = 0.00; % REMEBER WE ASUME THIS ONE AS ZERO
    L6 = 0.36830;
    L = 0.278;
    h = 0.064;
    H = 1.104;
    LH = sqrt(L2^2 + L3^2);

    % Transformation Matrices from origin {W0} to {BL} and {BR}
    TM_W0_BL = [ sqrt(2)/2, sqrt(2)/2, 0,  L;
                -sqrt(2)/2, sqrt(2)/2, 0, -h;
                 0,                 0, 1,  H;
                 0,                 0, 0,  1];

    TM_W0_BR = [-sqrt(2)/2,  sqrt(2)/2, 0, -L;
                -sqrt(2)/2, -sqrt(2)/2, 0, -h;
                 0,                  0, 1,  H;
                 0,                  0, 0,  1];

    % Transformation Matrices from {BL} and {BR} to coordinates {0}
    TM_BL_0 = [1, 0, 0,  0;
               0, 1, 0,  0;
               0, 0, 1, L0;
               0, 0, 0,  1];
    TM_BR_0 = TM_BL_0;


    % Transformation Matrices from {7} to coordinates of tools {GR} and {GL}
    TM_7_GL = [1, 0, 0,  0;
               0, 1, 0,  0;
               0, 0, 1, L6;
               0, 0, 0,  1];
    TM_7_GR = TM_7_GL;

    
    % Matrix from {Wo} to {0L}
    TM_W0_0L = TM_W0_BL * TM_BL_0;
    P_0L = TM_W0_0L(1:3, 4);

    % Matrix from {Wo} to {0R}
    TM_W0_0R = TM_W0_BR * TM_BR_0;
    P_0R = TM_W0_0R(1:3, 4);
    
    
    % Plot main Baxter left hand structure (from {W0} to {0L})
    X_POINTS = [0, 0, TM_W0_BL(1,4), TM_W0_0L(1,4)];
    Y_POINTS = [0, 0, TM_W0_BL(2,4), TM_W0_0L(2,4)];
    Z_POINTS = [0, H, TM_W0_BL(3,4), TM_W0_0L(3,4)];
    
    plot3(X_POINTS, Y_POINTS, Z_POINTS, "b","LineWidth", 8);
    hold on

    
    % Plot main Baxter right hand structure (from {W0} to {0L})
    X_POINTS = [0, 0, TM_W0_BR(1,4), TM_W0_0R(1,4)];
    Y_POINTS = [0, 0, TM_W0_BR(2,4), TM_W0_0R(2,4)];
    Z_POINTS = [0, H, TM_W0_BR(3,4), TM_W0_0R(3,4)];
    
    plot3(X_POINTS, Y_POINTS, Z_POINTS, "b","LineWidth", 8);
    hold on

    
    
    
    % Button to exit if needed
    EXIT = uicontrol('Style', 'PushButton', ...
                        'String', 'CLOSE FIGURES', ...
                        'Callback', 'close all');



    % Get amount of points to be plotted
    POINTS = size(POS_1, 1);

    plot3(POS_1(:,1), POS_1(:,2), POS_1(:,3));
    hold on

    
    plot3(POS_2(:,1), POS_2(:,2), POS_2(:,3));
    hold on
    
    
    % Main loop to plot the trajectory based on Inverse Kinematics
    for i=1:POINTS
        
        % LEFT ARM
        
        % Generate Trasformation Matrix for the Tool of left hand
        TM_tool_L = transformation([0, 0, 0], [POS_1(i,1), POS_1(i,2), POS_1(i,3)], 0);
        TM_tool_L = TM_tool_L* transformation([0, 0, 1], [0, 0, 0], ANG_1(i,3));
        TM_tool_L = TM_tool_L* transformation([0, 1, 0], [0, 0, 0], ANG_1(i,2));
        TM_tool_L = TM_tool_L* transformation([1, 0, 0], [0, 0, 0], ANG_1(i,1));
        
        % Calculate Inverse Kinematics given an specfic TM of tool
        THETAS_L(i,:) = inverse_kinematics_baxter(TM_tool_L, "left");
        
        % General DH table
        DH = [    0,  0,  0,        THETAS_L(i,1);
              -pi/2, L1,  0,        THETAS_L(i,2);
                  0, LH,  0, THETAS_L(i,3) + pi/2;
               pi/2,  0, L4,        THETAS_L(i,4);
              -pi/2, L5,  0,        THETAS_L(i,5);
               pi/2,  0,  0,        THETAS_L(i,6)];

           
           
        % Add points for the beggining of the arm (coordinate {0})
        X_POINTS = P_0L(1);
        Y_POINTS = P_0L(2);
        Z_POINTS = P_0L(3);
            
        for pos=1:6
            TM_current = denavit_hartenberg(DH(1:pos,:), 0);
            TM_current = TM_W0_0L* TM_current;
            P_current = TM_current(1:3, 4);
            X_POINTS = [X_POINTS, P_current(1)];
            Y_POINTS = [Y_POINTS, P_current(2)];
            Z_POINTS = [Z_POINTS, P_current(3)];
        end
           
        TM_W0_GL = TM_W0_0L * denavit_hartenberg(DH(1:6,:), 0) * TM_7_GL;
        P_current = TM_W0_GL(1:3, 4);
        X_POINTS = [X_POINTS, P_current(1)];
        Y_POINTS = [Y_POINTS, P_current(2)];
        Z_POINTS = [Z_POINTS, P_current(3)];
        
        arm_L = plot3(X_POINTS, Y_POINTS, Z_POINTS, "r","LineWidth", 3);
        pretty_figure("SANTIAGO'S BAXTER");
                

    
        
        
        
        
        % RIGHT ARM
        
        % Generate Trasformation Matrix for the Tool of right hand
        TM_tool_R = transformation([0, 0, 0], [POS_2(i,1), POS_2(i,2), POS_2(i,3)], 0);
        TM_tool_R = TM_tool_R* transformation([0, 0, 1], [0, 0, 0], ANG_2(i,3));
        TM_tool_R = TM_tool_R* transformation([0, 1, 0], [0, 0, 0], ANG_2(i,2));
        TM_tool_R = TM_tool_R* transformation([1, 0, 0], [0, 0, 0], ANG_2(i,1));
        
        % Calculate Inverse Kinematics given an specfic TM of tool
        THETAS_R(i,:) = inverse_kinematics_baxter(TM_tool_R, "right");
        
        % General DH table
        DH = [    0,  0,  0,        THETAS_R(i,1);
              -pi/2, L1,  0,        THETAS_R(i,2);
                  0, LH,  0, THETAS_R(i,3) + pi/2;
               pi/2,  0, L4,        THETAS_R(i,4);
              -pi/2, L5,  0,        THETAS_R(i,5);
               pi/2,  0,  0,        THETAS_R(i,6)];

           
           
        % Add points for the beggining of the arm (coordinate {0})
        X_POINTS = P_0R(1);
        Y_POINTS = P_0R(2);
        Z_POINTS = P_0R(3);
            
        for pos=1:6
            TM_current = denavit_hartenberg(DH(1:pos,:), 0);
            TM_current = TM_W0_0R * TM_current;
            P_current = TM_current(1:3, 4);
            X_POINTS = [X_POINTS, P_current(1)];
            Y_POINTS = [Y_POINTS, P_current(2)];
            Z_POINTS = [Z_POINTS, P_current(3)];
        end
           
        TM_W0_GR = TM_W0_0R * denavit_hartenberg(DH(1:6,:), 0) * TM_7_GR;
        P_current = TM_W0_GR(1:3, 4);
        X_POINTS = [X_POINTS, P_current(1)];
        Y_POINTS = [Y_POINTS, P_current(2)];
        Z_POINTS = [Z_POINTS, P_current(3)];
        
        arm_R = plot3(X_POINTS, Y_POINTS, Z_POINTS, "r","LineWidth", 3);
        pretty_figure("SANTIAGO'S BAXTER");
        
        
        
        
        
        xlim([-2, 2]);
        ylim([-2, 2]);
        zlim([0, 2]);        
        
        

           
        pause(1/1000);

        % Allows us to keep showing robot arm at the last point
        if i ~= POINTS
            delete(arm_L);
            delete(arm_R);
        end

        % When the exit button is pressed, lets us break the cycle
        if not(ishandle(EXIT))
            close all;
            break
        end
    end


end

