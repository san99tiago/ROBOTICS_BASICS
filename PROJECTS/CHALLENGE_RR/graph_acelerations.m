% GRAPH_ACELERATIONS Function to plot velocities for RR robot
% SANTIAGO GARCIA ARANGO


function [] = graph_acelerations(t, ace_x, ace_y)

    figure();

    subplot(2,1,2);
    plot(t, ace_y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("a_y [m/s^2]");
    pretty_figure("");

    subplot(2,1,1);
    plot(t, ace_x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("a_x [m/s^2]");
    pretty_figure("ACELERATIONS");


    set(gcf,'Position',[1000 320 500 350])

end

