% GRAPH_VELOCITIES Function to plot velocities for RR robot
% SANTIAGO GARCIA ARANGO


function [] = graph_velocities(t, vel_x, vel_y)

    figure();

    subplot(2,1,2);
    plot(t, vel_y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("v_y [m/s]");
    pretty_figure("");

    subplot(2,1,1);
    plot(t, vel_x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("v_x [m/s]");
    pretty_figure("VELOCITIES");

    set(gcf,'Position',[980 350 500 350])

end

