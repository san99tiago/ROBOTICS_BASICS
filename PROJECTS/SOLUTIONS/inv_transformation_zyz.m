

function [beta, alfa, gamma, P] = inv_transformation_zyz(TM)
% INV_TRANSFORMATION--> Return info from transformation matrix

if nargin < 1
    syms theta
    TM = zeros(4,4);
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end

% Get the angles from the tranformation matrix with fixed angles approach
% Note: these equations are from Craig Robotics book
beta = atan2(sqrt(TM(3,1)^2 + TM(3,2)^2), TM(3,3));

alfa = atan2(TM(2,3)/sin(beta), TM(1,3)/sin(beta));

gamma = atan2(TM(3,2)/sin(beta), -TM(3,1)/sin(beta));


% Get the distance vector
P = TM(1:3,4);
end
