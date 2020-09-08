% PRETTY_FIGURE: LETS US EDIT CURRENT FIGURE AND MAKE IT "PRETTIER"
% Santiago Garcia Arango
%-----------------------------------------------------------------------------------------
% WHAT IS THIS FUNCTION?
% This is a simple function created by Santiago Garcia, to make a figure...
% pretty, based on the colors, background, linewidth, title, etc.
%
% HOW TO USE?
% In this case, the way to use it is to have an active figure on a
% MATLAB script and run the function by calling it (and it works on top of
% this current figure)
%
% PARAMETERS:
% --> figure_name: name that we want to the title of the current figure
%
%-----------------------------------------------------------------------------------------

function [] = pretty_figure(figure_name)
    % Add main title to figure
    title(figure_name);
    
    % Include grid to have a better view of points and scales
    grid on
    
    % Save figure in a "Current Figure Handle"
    fig = gcf;
    
    % Change figure color for the background (in this case a cool blue)
    fig.Color = [0.2 1 1];
    
    % We add the same title to the figure
    fig.Name = figure_name;
    
    % Create "Current Axis Handle" to edit axis and its parameters
    ax = gca;
    
    % Change fontsize for both axis
    ax.FontSize = 12;
    
    % Resize and relocate figure (could change based on screen-size)
    set(gcf,'Position',[10 250 700 500])
        
    % We add the hold on, to be able to plot multiple things
    hold on
end
    