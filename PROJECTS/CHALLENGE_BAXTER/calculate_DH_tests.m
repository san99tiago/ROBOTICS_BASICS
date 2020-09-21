% Denavit-Hartenberg parameters for 6 DOF (one canceled)

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
   

[TM, TM_test] = denavit_hartenberg(DH);

simplify(TM)
