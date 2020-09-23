% Denavit-Hartenberg parameters for 6 DOF (one canceled)

%% TEST 1
syms theta1 theta2 theta4 theta5 theta6 theta7 L1 L2 L3 L4 L5 LH


% Assume symbolic variables are real (avoid "complex")
assume(theta1, "positive")
assume(theta2, "positive")
assume(theta4, "positive")
assume(theta5, "positive")
assume(theta6, "positive")
assume(theta7, "positive")
assume(L1, "positive")
assume(L2, "positive")
assume(L4, "positive")
assume(L5, "positive")
assume(LH, "positive")


DH = [    0,  0,  0,        theta1;
      -pi/2, L1,  0,        theta2;
          0, LH,  0, theta4 + pi/2;
       pi/2,  0, L4,        theta5;
      -pi/2, L5,  0,        theta6;
       pi/2,  0,  0,        theta7];
   

[TM_0_6, TM_test] = denavit_hartenberg(DH, 1);

simplify(TM_0_6)


%% TEST 2
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
theta1 = deg2rad(10);
theta2 = deg2rad(20);
theta4 = deg2rad(40);
theta5 = deg2rad(50);
theta6 = deg2rad(60);
theta7 = deg2rad(70);

DH = [    0,  0,  0,        theta1;
      -pi/2, L1,  0,        theta2;
          0, LH,  0, theta4 + pi/2;
       pi/2,  0, L4,        theta5;
      -pi/2, L5,  0,        theta6;
       pi/2,  0,  0,        theta7];
   

[TM_0_6, TM_test] = denavit_hartenberg(DH, 1);

TM_0_6


TM_W0_BL = [ sqrt(2)/2, sqrt(2)/2, 0,  L;
            -sqrt(2)/2, sqrt(2)/2, 0, -h;
             0,                 0, 1,  H;
             0,                 0, 0,  1];
TM_BL_0 = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L0;
           0, 0, 0,  1];
TM_7_GL = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L6;
           0, 0, 0,  1];
       
TM_W0_GL = TM_W0_BL * TM_BL_0 * TM_0_6 * TM_7_GL


%% TEST 3
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
theta1 = deg2rad(0);
theta2 = deg2rad(0);
theta4 = deg2rad(0);
theta5 = deg2rad(0);
theta6 = deg2rad(0);
theta7 = deg2rad(0);

DH = [    0,  0,  0,        theta1;
      -pi/2, L1,  0,        theta2;
          0, LH,  0, theta4 + pi/2;
       pi/2,  0, L4,        theta5;
      -pi/2, L5,  0,        theta6;
       pi/2,  0,  0,        theta7];
   

[TM_0_6, TM_test] = denavit_hartenberg(DH, 1);

TM_0_6


TM_W0_BL = [ sqrt(2)/2, sqrt(2)/2, 0,  L;
            -sqrt(2)/2, sqrt(2)/2, 0, -h;
             0,                 0, 1,  H;
             0,                 0, 0,  1];
TM_BL_0 = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L0;
           0, 0, 0,  1];
TM_7_GL = [1, 0, 0,  0;
           0, 1, 0,  0;
           0, 0, 1, L6;
           0, 0, 0,  1];
       
TM_W0_GL = TM_W0_BL * TM_BL_0 * TM_0_6 * TM_7_GL

