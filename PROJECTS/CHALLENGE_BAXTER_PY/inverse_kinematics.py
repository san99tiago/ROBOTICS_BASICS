#!/usr/bin/env python
# INVERSE KINEMATICS FOR BAXTER ROBOT WITH 6 DOF
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import math
import constants_baxter
import denavit_hartenberg


def inverse_kinematics_baxter(TM_W0_Gtool, arm_side):
    """
    Baxter's inverse kinematics from given transformation matrix.

    :param TM_W0_Gtool: transformation matrix from {world frame} to {tool}.
    :param arm_side: specifies the arm to process ("left" of "right").
    :returns: list of theta angles [theta1,theta2,theta4,theta5,theta6,theta7].
    """

    # Get all constants for the distances and transformations for Baxter
    Constants = constants_baxter.GetConstants()
    L0 = Constants.L0
    L1 = Constants.L1
    L2 = Constants.L2
    L3 = Constants.L3
    L4 = Constants.L4
    L6 = Constants.L6
    L = Constants.L
    h = Constants.h
    H = Constants.H
    LH = Constants.LH
    TM_W0_BL = Constants.TM_W0_BL
    TM_W0_BR = Constants.TM_W0_BR
    TM_BL_0 = Constants.TM_BL_0
    TM_BR_0 = Constants.TM_BR_0
    TM_7_GL = Constants.TM_7_GL
    TM_7_GR = Constants.TM_7_GR

    # Apply inverse kinematics for the left arm
    if arm_side == "left":
        # Understanding the corresponding TM from the article, this can be solved:
        TM_0_6 = np.dot(np.dot(np.linalg.inv(np.dot(TM_W0_BL,TM_BL_0)), TM_W0_Gtool), np.linalg.inv((TM_7_GR)))

        # Find theta1
        PX_0_4 = TM_0_6[0, 3]
        PY_0_4 = TM_0_6[1, 3]

        theta1 = math.atan2(PY_0_4, PX_0_4)

        # Find theta2
        PZ_0_4 = TM_0_6[2, 3]
        E = 2*LH*(L1 - PX_0_4/math.cos(theta1))
        F = 2*LH*PZ_0_4
        G = (PX_0_4**2)/((math.cos(theta1))**2) + L1**2 + LH**2 - L4**2 + PZ_0_4**2 - 2*L1*PX_0_4/math.cos(theta1)


        if (E**2 + F**2 - G**2)>0:
            t1 = (-F + math.sqrt(E**2 + F**2 - G**2))/(G - E)
        else: 
            t1 = (-F - 0)/(G - E)
        theta2 = 2*math.atan(t1)

        # We make only use the real part (img is not significant most of the times)
        #if (E**2 + F**2 - G**2)>0:
            #t2 = (-F - math.sqrt(E**2 + F**2 - G**2))/(G - E)
        #else:
            #t2 = (-F - 0)/(G - E)
        #theta2 = 2*math.atan(t2)



        # Find theta4
        theta4 = math.atan2(-PZ_0_4 - LH*math.sin(theta2), PX_0_4/math.cos(theta1) - L1 - LH*math.cos(theta2)) - theta2

        # Find theta5
        DH_0_3 = np.array([[0, 0, 0, theta1],
                        [-math.pi/2, L1, 0, theta2],
                        [0, LH, 0, theta4 + math.pi/2]])

        TM_0_3 = denavit_hartenberg.denavit_hartenberg(DH_0_3, 0)
        R_0_3 = TM_0_3[0:3, 0:3]

        R_0_6 = TM_0_6[0:3, 0:3]

        R_3_6 = np.dot(np.linalg.inv(R_0_3), R_0_6)

        theta5 = math.atan2(R_3_6[2,2], R_3_6[0,2])

        # Find theta7
        theta7 = math.atan2(-R_3_6[1,1], R_3_6[1,0])


        # Find theta6
        theta6 = math.atan2(R_3_6[1,0]/math.cos(theta7), -R_3_6[1,2])


        return [theta1, theta2, theta4, theta5, theta6, theta7]


# TESTS
if __name__ == "__main__":
    # -------------- TEST 1 (real Baxter values)-----------------
    TM_W0_GL = np.array([[0.733, 0.653, 0.190, 0.843],
                        [0.384, -0.628, 0.677, -0.162],
                        [0.562, -0.423, -0.711, 0.661],
                        [0, 0, 0, 1]])
    THETAS = inverse_kinematics_baxter(TM_W0_GL, "left")

    # Convert resulting angles to degrees
    THETAS = np.rad2deg(THETAS)
    print(THETAS)



