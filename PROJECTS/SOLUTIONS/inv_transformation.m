% GENERAL FUNCTION TO GET ANGLES FROM TRANSFORMATION MATRIX
% SANTIAGO GARCIA ARANGO
% Input analysis:
% TM: Transformation matrix. (4 x 4)
% Output analysis:
% vector_K: vector that is the rotation axis of the matrix. (1 x 3)
% angle: angle with the rotation of the given axis.
% P: vector of [Px, Py, Pz] of the position. (1 x 3)

function [vector_K, angle, P] = inv_transformation(TM)
% INV_TRANSFORMATION--> Return info from transformation matrix

if nargin < 1
    syms theta
    TM = zeros(4,4);
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end

% Get the angle from the tranformation matrix
% Extreme cases for a 0 degrees, 180 degrees (and normal case)
N = TM(1,1) + TM(2,2) + TM(3,3);
if N == 3
    angle = 0;
elseif N == -1
    angle = 180;
else
    angle = acos((TM(1,1) + TM(2,2) + TM(3,3) - 1)/2);
end


% Get the vector_K or the rotation of the axis of the rotation matrix
% We must evaluate two cases (if angle==180) and else.
if angle == 180
    fprintf("IF Kx is aproximately zero, then there could be a mistake")
    fprintf("** \n ** \n ** \n ** \n")
    vector_K(1) = sqrt((TM(1,1) + 1)/2);
    vector_K(2) = TM(1,2)/(2* vector_K(1));
    vector_K(3) = TM(3,1)/(2* vector_K(1));   
else
    constant = 1/(2*sin(angle));
    vector_K = constant*[TM(3,2) - TM(2,3); TM(1,3) - TM(3,1); TM(2,1) - TM(1,2)];

P = TM(1:3,4);
end
