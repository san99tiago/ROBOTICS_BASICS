% GRAPH_POSITIONS Function to plot positions for BAXTER
% SANTIAGO GARCIA ARANGO
% t --> time vector
% x --> x positions vector
% y --> y positions vector
% z --> z positions vector
% x_angle --> x angle vector
% y_angle --> y angle vector
% z_angle --> z angle vector

function [] = graph_positions(t, x, y, z, x_angle, y_angle, z_angle, arm_side)

    figure();
    subplot(3,2,5);
    plot(t, z, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("z [m]");
    pretty_figure("");

    subplot(3,2,3);
    plot(t, y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("y [m]");
    pretty_figure("");

    subplot(3,2,1);
    plot(t, x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("x [m]");
    
    if arm_side == "left"
        pretty_figure("LEFT ARM POSITIONS");
    else 
        pretty_figure("RIGHT ARM POSITIONS");
    end


    subplot(3,2,6);
    plot(t, z_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("z angle [rad]");
    pretty_figure("");

    subplot(3,2,4);
    plot(t, y_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("y angle [rad]");
    pretty_figure("");


    subplot(3,2,2);
    plot(t, x_angle, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("x angle [rad]");

    if arm_side == "left"
        pretty_figure("LEFT ARM ANGLES");
    else 
        pretty_figure("RIGHT ARM ANGLES");
    end
    
    
    set(gcf,'Position',[960 380 500 350])

end

