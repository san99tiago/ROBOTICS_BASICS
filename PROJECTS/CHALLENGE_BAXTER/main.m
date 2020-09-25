% CHALLENGE: DRAW A ROBOTIC BAXTER ARM FROM POINT A TO POINT B
% Challenge for robotics class
% SANTIAGO GARCIA ARANGO
% ------------------------------------------------------------------------

% Get initial and final transformations from positions and angles (inputs)
[TM_A_1, TM_B_1, POINT_A_1, POINT_B_1] = get_initial_tranformations_1();
[TM_A_2, TM_B_2, POINT_A_2, POINT_B_2] = get_initial_tranformations_2();


%%
% Define the amout of points for the vector of point in trajectory
TIME = 10;


% Generate main trajectories of 5th order for POS-ANG with derivatives
for var=1:3
    % LEFT ARM...
    % Generate the X, Y, Z positions vectors with its derivatives
    [~, POS_1(:,var), D_POS_1(:,var),DD_POS_1(:,var)] = find_trajectory(...
       str2double(POINT_A_1{var}), str2double(POINT_B_1{var}), TIME);
    
   % Generate the X, Y, Z angles vectors with its derivatives
    [t, ANG_1(:,var), D_ANG_1(:,var),DD_ANG_1(:,var)] = find_trajectory(...
       str2double(POINT_A_1{var+3}), str2double(POINT_B_1{var+3}), TIME);
    
   
   % RIGHT ARM...
   % Generate the X, Y, Z positions vectors with its derivatives
    [~, POS_2(:,var), D_POS_2(:,var),DD_POS_2(:,var)] = find_trajectory(...
       str2double(POINT_A_2{var}), str2double(POINT_B_2{var}), TIME);
    
   % Generate the X, Y, Z angles vectors with its derivatives
    [t, ANG_2(:,var), D_ANG_2(:,var),DD_ANG_2(:,var)] = find_trajectory(...
       str2double(POINT_A_2{var+3}), str2double(POINT_B_2{var+3}), TIME);
end

%% 
% Graph the animated trajectory point by point
  
animate_trajectory(POS_1, ANG_1, POS_2, ANG_2);

%%
% Graph the variable plots for both arms

graph_positions(t, POS_1(:,1), POS_1(:,2), POS_1(:,3),...
                    ANG_1(:,1), ANG_1(:,2), ANG_1(:,3), "left");
                    
graph_positions(t, POS_2(:,1), POS_2(:,2), POS_2(:,3),...
                    ANG_2(:,1), ANG_2(:,2), ANG_2(:,3), "right");
                    
graph_velocities(t, D_POS_1(:,1), D_POS_1(:,2), D_POS_1(:,3),...
                    D_ANG_1(:,1), D_ANG_1(:,2), D_ANG_1(:,3), "left");
                    
graph_velocities(t, D_POS_2(:,1), D_POS_2(:,2), D_POS_2(:,3),...
                    D_ANG_2(:,1), D_ANG_2(:,2), D_ANG_2(:,3), "right");

graph_acelerations(t, DD_POS_1(:,1), DD_POS_1(:,2), DD_POS_1(:,3),...
                     DD_ANG_1(:,1), DD_ANG_1(:,2), DD_ANG_1(:,3), "left");
                    
graph_acelerations(t, DD_POS_2(:,1), DD_POS_2(:,2), DD_POS_2(:,3),...
                    DD_ANG_2(:,1), DD_ANG_2(:,2), DD_ANG_2(:,3), "right");
