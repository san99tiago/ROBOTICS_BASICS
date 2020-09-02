% GENERAL FUNCTION TO GET ANGLES FROM TRANSFORMATION MATRIX
% SANTIAGO GARCIA ARANGO
% Input analysis:
% TM: Transformation matrix. (4 x 4)
% Output analysis:
% vector_K: vector that is the rotation axis of the matrix. (1 x 3)
% angle: angle with the rotation of the given axis.


function [vector_K, angle] = inv_transformation(TM)
% INV_TRANSFORMATION--> Return info from transformation matrix

if nargin < 1
    syms theta
    TM = zeros(4,4);
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end

% Get the angle from the tranformation matrix
angle = acos((TM(1,1) + TM(2,2) + TM(3,3) - 1)/2);

% Get the vector_K or the rotation of the axis of the rotation matrix
constant = 1/(2*sin(angle));
vector_K = constant*[TM(3,2) - TM(2,3); TM(1,3) - TM(3,1); TM(2,1) - TM(1,2)];

disp(vector_K)

end

