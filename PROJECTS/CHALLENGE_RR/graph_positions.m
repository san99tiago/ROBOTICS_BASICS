% GRAPH_POSITIONS Function to plot positions for RR robot
% SANTIAGO GARCIA ARANGO


function [] = graph_positions(t, x, y)

    figure();
    

    subplot(2,1,2);
    plot(t, y, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("y [m]");
    pretty_figure("");

    subplot(2,1,1);
    plot(t, x, "LineWidth", 1.5);
    xlabel("Time [s]");
    ylabel("x [m]");
    pretty_figure("POSITIONS");   
    

    set(gcf,'Position',[960 380 500 350])

end

