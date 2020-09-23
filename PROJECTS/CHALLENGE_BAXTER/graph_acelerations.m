% GRAPH_ACELERATIONS Function to plot velocities for Baxter robot
% SANTIAGO GARCIA ARANGO
% t --> time vector
% ace_x --> x aceleration vector
% ace_y --> y aceleration vector
% ace_z --> z aceleration vector
% ace_x_angle --> x angular aceleration vector
% ace_y_angle --> y angular aceleration vector
% ace_z_angle --> z angular aceleration vector

function [] = graph_acelerations(t, ace_x, ace_y, ace_z, ...
                        ace_x_angle, ace_y_angle, ace_z_angle, arm_side)

    figure();
    subplot(3,2,5);
    plot(t, ace_z, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("a_z [m/s^2]");
    pretty_figure("");

    subplot(3,2,3);
    plot(t, ace_y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("a_y [m/s^2]");
    pretty_figure("");

    subplot(3,2,1);
    plot(t, ace_x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("a_x [m/s^2]");
    
    if arm_side == "left"
        pretty_figure("LEFT ARM LINEAR ACELERATIONS");
    else 
        pretty_figure("RIGHT ARM LINEAR ACELERATIONS");
    end


    subplot(3,2,6);
    plot(t, ace_z_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("A_z [rad/s^2]");
    pretty_figure("");

    subplot(3,2,4);
    plot(t, ace_y_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("A_y [rad/s^2]");
    pretty_figure("");


    subplot(3,2,2);
    plot(t, ace_x_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("A_x [rad/s^2]");

    if arm_side == "left"
        pretty_figure("LEFT ARM ANGULAR ACELERATIONS");
    else 
        pretty_figure("RIGHT ARM ANGULAR ACELERATIONS");
    end            


    set(gcf,'Position',[1000 320 500 350])

end

