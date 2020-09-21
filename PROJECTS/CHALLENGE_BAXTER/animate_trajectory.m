% ANIMATE_TRAJECTORY: script to animate a trajectory from two vectors
% SANTIAGO GARCIA ARANGO
% ------------------------------------------------------------------------
% Parameters:
% --> POS_1: X, Y, Z positions
% --> ANG_1: X, Y, Z angles



function [THETAS] = animate_trajectory(POS_1, ANG_1)
    % Start the figure animation
    figure(1)
    
    % Button to exit if needed
    EXIT = uicontrol('Style', 'PushButton', ...
                        'String', 'CLOSE FIGURES', ...
                        'Callback', 'close all');



    % Get amount of points to be plotted
    POINTS = size(POS_1, 1);

    % Main loop to plot the trajectory based on Inverse Kinematics
    for i=1:POINTS
        
        % Generate Trasformation Matrix for the Tool
        TM_tool = transformation([0, 0, 0], [POS_1(i,1), POS_1(i,2), POS_1(i,3)], 0);
        TM_tool = TM_tool* transformation([0, 0, 1], [0, 0, 0], ANG_1(i,3));
        TM_tool = TM_tool* transformation([0, 1, 0], [0, 0, 0], ANG_1(i,2));
        TM_tool = TM_tool* transformation([1, 0, 0], [0, 0, 0], ANG_1(i,1));
        
        % Calculate Inverse Kinematics given an specfic TM of tool
        THETAS(i,:) = inverse_kinematics_baxter(TM_tool);
        
        
%         b1 = line(b1_x, b1_y, "LineWidth", 2);
%         b2 = line(b2_x, b2_y, "LineWidth", 2);
% 
%         xlim([-10, 10]);
%         ylim([-10, 10]);
%         pretty_figure("SANTIAGO GARCIA'S ROBOT ARM");

        pause(1/1000);

        % Allows us to keep showing robot arm at the last point
        if i ~= POINTS
%             delete(b1);
        end

        % When the exit button is pressed, lets us break the cycle
        if not(ishandle(EXIT))
            close all;
            break
        end
    end


end

