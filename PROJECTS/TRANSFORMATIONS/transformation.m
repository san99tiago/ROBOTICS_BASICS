% GENERAL FUNCTION TO GET THE TRANSFORMATION MATRIX
% SANTIAGO GARCIA ARANGO
% Input analysis:
% vector_K: vector that will be the rotation axis. [kx, ky, kz] (1 x 3)
% angle: angle that will be rotated on vector_k. [entry syms or radians]
% vector_AB: vector from A org to B org. [ABx, ABy, ABz] (1 x 3)


function [TM] = transformation(vector_K, vector_AB, angle)
% TRANSFORMATION--> Return transformation matrix from spceific parameters

if nargin < 3
    syms theta
    vector_K = [0.7070, 0.7070, 0];
    vector_AB = [0, 0, 0];
    angle = deg2rad(30);
    fprintf("\n \n \n \n *ENTER ALL PARAMETERS TO FUNCTION* \n \n \n \n");
end


% Add extra "1" to vector_AB and transpose it to get size (4 x 1)
vector_AB(4) = 1;
vector_AB = vector_AB';

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

