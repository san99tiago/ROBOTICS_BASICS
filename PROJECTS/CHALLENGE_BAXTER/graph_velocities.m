% GRAPH_VELOCITIES Function to plot velocities for Baxter robot
% SANTIAGO GARCIA ARANGO
% t --> time vector
% vel_x --> x velocity vector
% vel_y --> y velocity vector
% vel_z --> z velocity vector
% vel_x_angle --> x angular velocity vector
% vel_y_angle --> y angular velocity vector
% vel_z_angle --> z angular velocity vector


function [] = graph_velocities(t, vel_x, vel_y, vel_z,...
                vel_x_angle, vel_y_angle, vel_z_angle, arm_side)

    figure();
    subplot(3,2,5);
    plot(t, vel_z, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("V_z [m/s]");
    pretty_figure("");

    subplot(3,2,3);
    plot(t, vel_y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("V_y [m/s]");
    pretty_figure("");

    subplot(3,2,1);
    plot(t, vel_x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("V_x [m/s]");
    
    if arm_side == "left"
        pretty_figure("LEFT ARM LINEAR VELOCITIES");
    else 
        pretty_figure("RIGHT ARM LINEAR VELOCITIES");
    end


    subplot(3,2,6);
    plot(t, vel_z_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("W_z [rad/s]");
    pretty_figure("");

    subplot(3,2,4);
    plot(t, vel_y_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("W_y [rad/s]");
    pretty_figure("");


    subplot(3,2,2);
    plot(t, vel_x_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("W_x [rad/s]");

    if arm_side == "left"
        pretty_figure("LEFT ARM ANGULAR VELOCITIES");
    else 
        pretty_figure("RIGHT ARM ANGULAR VELOCITIES");
    end            


    set(gcf,'Position',[980 350 500 350])

end

