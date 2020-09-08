% FUNCTION TO DETERMINE IF A TRANSFORMATION MATRIX IS VALID BASED ON ROT.

function [is_valid] = is_tm_valid(TM)
%IS_ROTATION_VALID: Function to determine if a TM is valid


R = TM(1:3, 1:3);  % Acces only the rotation matrix


% Condition 1: matriz is identity matrix
% Check the error inbetween matrix and identity (check for about equal)
error = abs(R*R' - eye(3));
if sum(error) < 0.000001
    condition_1 = 1;
else
    condition_1 = 0;
end


% Condition 2: determinant of Rotation is 1
error = abs(det(R) - 1);
if error < 0.000001
    condition_2 = 1;
else
    condition_2 = 0;
end

% If both conditions are valid, then we conclude the TM is correct
if ( (condition_1) && (condition_2) )
    is_valid = 1;
else
    is_valid = 0;
end

end

