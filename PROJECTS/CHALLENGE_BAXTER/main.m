% CHALLENGE: DRAW A ROBOTIC BAXTER ARM FROM POINT A TO POINT B
% SANTIAGO GARCIA ARANGO

% Measurements of Baxter's distances (see given document)
L0 = 0.27035;
L1 = 0.069;
L2 = 0.36435;
L3 = 0.069;
L4 = 0.37429;
L5 = 0.01;
L6 = 0.36830;
L = 0.278;
h = 0.064;
H = 1.104;
LH = sqrt(L2^2 + L3^2);

         

%%
% Get initial and final transformations from positions and angles (inputs)
[TM_A, TM_B, POINT_A, POINT_B] = get_initial_tranformations();


%%
% Define the amout of points for the vector of point in trajectory
TIME = 10;


% Generate main trajectories of 5th order for POS-ANG with derivatives
for var=1:3
    % Generate the X, Y, Z positions vectors with its derivatives
    [~, POS_1(:,var), D_POS_1(:,var),DD_POS_1(:,var)] = find_trajectory(...
       str2double(POINT_A{var}), str2double(POINT_B{var}), TIME);
    
   % Generate the X, Y, Z angles vectors with its derivatives
    [t, ANG_1(:,var), D_ANG_1(:,var),DD_ANG_1(:,var)] = find_trajectory(...
       str2double(POINT_A{var+3}), str2double(POINT_B{var+3}), TIME);
end


                    
animate_trajectory(POS_1, ANG_1);


% graph_positions(t, POS_1(:,1), POS_1(:,2));
% graph_positions(t, ANG_1(:,1), ANG_1(:,2));
% graph_velocities(t, vel_x, vel_y);
% graph_acelerations(t, ace_x, ace_y);


