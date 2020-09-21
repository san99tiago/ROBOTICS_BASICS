%INVERSE_KINEMATICS_BAXTER
% SANTIAGO GARCIA ARANGO



function [THETAS] = inverse_kinematics_baxter(TM_W0_GL)


% Remark: remember that theta3=0 and L5=0
% Measurements of Baxter's distances (see given document)
L0 = 0.27035;
L1 = 0.069;
L2 = 0.36435;
L3 = 0.069;
L4 = 0.37429;
L6 = 0.36830;
L = 0.278;
h = 0.064;
H = 1.104;
LH = sqrt(L2^2 + L3^2);

% Transformation Matrices from origin {W0} to {BL} and {BR}
TM_W0_BL = [ sqrt(2)/2, sqrt(2)/2, 0,  L;
            -sqrt(2)/2, sqrt(2)/2, 0, -h;
             0,                 0, 1,  H;
             0,                 0, 0,  1];

         
TM_W0_BR = [-sqrt(2)/2,  sqrt(2)/2, 0, -L;
            -sqrt(2)/2, -sqrt(2)/2, 0, -h;
             0,                  0, 1,  H;
             0,                  0, 0,  1];


% Transformation Matrices from {BL} and {BR} to coordinates {0}
TM_BL_0 = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L0;
           0, 0, 0,  1];
TM_BR_0 = TM_BL_0;


% Transformation Matrices from {7} to coordinates of tools {GR} and {GL}
TM_7_GL = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L6;
           0, 0, 0,  1];
TM_7_GR = TM_7_GL;




% Understanding the corresponding TM from the article, this can be solved:
TM_0_6 = (TM_W0_BL * TM_BL_0)^(-1) * TM_W0_GL * (TM_7_GL)^(-1)


% Find theta1
PX_0_4 = TM_0_6(1, 4);
PY_0_4 = TM_0_6(2, 4);

theta1 = atan2(PY_0_4, PX_0_4)


% Find theta2
PZ_0_4 = TM_0_6(3, 4);
E = 2*LH*(L1 - PX_0_4/cos(theta1));
F = 2*LH*PZ_0_4;
G = (PX_0_4^2)/((cos(theta1))^2) + L1^2 + LH^2 - L4^2 + PZ_0_4^2 - 2*L1*PX_0_4/cos(theta1);

t1 = (-F + sqrt(E^2 + F^2 - G^2))/(G - E);

theta2 = 2*atan(t1)


% Find theta4
theta4 = atan2(-PZ_0_4 - LH*sin(theta2), PX_0_4/cos(theta1) - L1 - LH*cos(theta2)) - theta2


% Find theta5
DH_0_3 = [    0,  0,  0,        theta1;
          -pi/2, L1,  0,        theta2;
              0, LH,  0, theta4 + pi/2];
              
TM_0_3 = denavit_hartenberg(DH_0_3);
R_0_3 = TM_0_3(1:3, 1:3);

R_0_6 = TM_0_6(1:3, 1:3);

R_3_6 = (R_0_3)^(-1) * R_0_6;

theta5 = atan2(R_3_6(3,3), R_3_6(1,3))


% Find theta7
theta7 = atan2(-R_3_6(2,2), R_3_6(2,1))


% Find theta6
theta6 = atan2(R_3_6(2,1)/cos(theta7), -R_3_6(2,3))


THETAS = [theta1, theta2, theta4, theta5, theta6, theta7];

end

