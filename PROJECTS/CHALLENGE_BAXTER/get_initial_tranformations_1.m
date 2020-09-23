% GET_INITIAL_TRANSFORMATIONS FOR BAXTER'S LEFT ARM
% SANTIAGO GARCIA ARANGO
% Function to get user inputs and create tranformations matrices from it...
% it also returns the specific points for (x,y,z,x_anle,y_angle,z_angle)

function [TM_A, TM_B, POINT_A, POINT_B] = get_initial_tranformations_1()
% Access the initial point "A" for baxter arm
POINT_A = inputdlg({'X_pos inicial','Y_pos inicial', 'Z_pos inicial', ...
                'X_angle inicial', 'Y_angle inicial', 'Z_angle inicial'}, ...
              'Santiago Garcia', [1 50; 1 50; 1 50; 1 50; 1 50; 1 50], ...
              {'1.1','-0.5','0.8','0.7854','-1.5708', '1.5708'}); 

% Initial positions and angles based on user input
x_pos_inicial = str2double(POINT_A{1});
y_pos_inicial = str2double(POINT_A{2});
z_pos_inicial = str2double(POINT_A{3});
x_angle_inicial = str2double(POINT_A{4});
y_angle_inicial = str2double(POINT_A{5});
z_angle_inicial = str2double(POINT_A{6});


% Access the final point "B" for baxter arm
POINT_B = inputdlg({'X_pos final','Y_pos final', 'Z_pos final', ...
                'X_angle final', 'Y_angle final', 'Z_angle final'}, ...
              'Santiago Garcia', [1 50; 1 50; 1 50; 1 50; 1 50; 1 50], ...
              {'0.7','-0.162','0.661','0.7854','-1.5708', '1.5708'}); 

% final positions and angles based on user input
x_pos_final = str2double(POINT_B{1});
y_pos_final = str2double(POINT_B{2});
z_pos_final = str2double(POINT_B{3});
x_angle_final = str2double(POINT_B{4});
y_angle_final = str2double(POINT_B{5});
z_angle_final = str2double(POINT_B{6});

% Get point A transformation matrix
TM_A = transformation([0, 0, 0], [x_pos_inicial, y_pos_inicial, z_pos_inicial], 0);
TM_A = TM_A * transformation([0, 0, 1], [0, 0, 0], z_angle_inicial);
TM_A = TM_A * transformation([0, 1, 0], [0, 0, 0], y_angle_inicial);
TM_A = TM_A * transformation([1, 0, 0], [0, 0, 0], x_angle_inicial);


% Get point B transformation matrix
TM_B = transformation([0, 0, 0], [x_pos_final, y_pos_final, z_pos_final], 0);
TM_B = TM_B * transformation([0, 0, 1], [0, 0, 0], z_angle_final);
TM_B = TM_B * transformation([0, 1, 0], [0, 0, 0], y_angle_final);
TM_B = TM_B * transformation([1, 0, 0], [0, 0, 0], x_angle_final);


end

