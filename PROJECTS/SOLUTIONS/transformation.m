% GENERAL FUNCTION TO GET THE TRANSFORMATION MATRIX
% SANTIAGO GARCIA ARANGO
% Input analysis:
% vector_K: vector that will be the rotation axis. [kx, ky, kz] (1 x 3)
% angle: angle that will be rotated on vector_k. [entry syms or radians]
% vector_AB: vector from A org to B org. [ABx, ABy, ABz] (1 x 3)
% isSymbolic: paramater to check if vector_K has symbolic inputs. (1=yes)


function [TM] = transformation(vector_K, vector_AB, angle, isSymbolic)
% TRANSFORMATION--> Return transformation matrix from spceific parameters

% If there is NOT a "isSymbolic" input, make it false
if nargin == 3
    isSymbolic = 0;
end

if nargin < 3
    vector_K = [1, 0, 0];
    vector_AB = [0, 0, 0];
    angle = deg2rad(30);
    isSymbolic = 0;
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end


% Add extra "1" to vector_AB and transpose it to get size (4 x 1)
vector_AB(4) = 1;
% assume(vector_AB(:), "real");
vector_AB = vector_AB';



% If entry vector is NOT symbolic and is NOT null, then normalize it
% Note: they go in different "ifs" to make it clear:
% First if: check if ALL vector_K is NOT null (if null, pass)
% Second if: check if there are symbolic expressions (to avoid normalize)
if not(sum(vector_K(:)==0) == 3)
    if isSymbolic == 0
        % Normalize vector to make it unitary
        vector_K = vector_K/norm(vector_K);
    end
end

% Use math properties to find the Rotation Matrix
Kx = vector_K(1);
Ky = vector_K(2);
Kz = vector_K(3);
V0 = 1 - cos(angle);
C = cos(angle);
S = sin(angle);

RotMat = [Kx*Kx*V0 + C, Kx*Ky*V0 - Kz*S, Kx*Kz*V0 + Ky*S;
          Kx*Ky*V0 + Kz*S, Ky*Ky*V0 + C, Ky*Kz*V0 - Kx*S;
          Kx*Kz*V0 - Ky*S, Ky*Kz*V0 + Kx*S, Kz*Kz*V0 + C;
          0, 0, 0];

TM = [RotMat, vector_AB];      


end

