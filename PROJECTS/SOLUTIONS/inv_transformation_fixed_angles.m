% GENERAL FUNCTION TO GET FIXED ANGLES FROM TRANSFORMATION MATRIX
% SANTIAGO GARCIA ARANGO
% Input analysis:
% TM: Transformation matrix. (4 x 4)
% Output analysis:
% x_angle: angle with the rotation of the given axis.
% y_angle: angle with the rotation of the given axis.
% z_angle: angle with the rotation of the given axis.
% P: vector of [Px, Py, Pz] of the position. (1 x 3)

function [x_angle, y_angle, z_angle, P] = inv_transformation_fixed_angles(TM)
% INV_TRANSFORMATION--> Return info from transformation matrix

if nargin < 1
    syms theta
    TM = zeros(4,4);
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end

% Get the angles from the tranformation matrix with fixed angles approach
% Note: these equations are from Craig Robotics book
y_angle = atan2(-TM(3,1), sqrt(TM(1,1)^2 + TM(2,1)^2));

% We compute all the possible cases from the boundaries (if necessary)
if y_angle == pi/2
    z_angle = 0;
    x_angle = atan2(TM(1,2), TM(2,2));
elseif y_angle == -pi/2
    z_angle = 0;
    x_angle = -atan2(TM(1,2), TM(2,2));
else
    z_angle = atan2(TM(2,1)/cos(y_angle), TM(1,1)/cos(y_angle));
    x_angle = atan2(TM(3,2)/cos(y_angle), TM(3,3)/cos(y_angle));
end

% Get the distance vector
P = TM(1:3,4);
end
