#!/usr/bin/env python
# DENAVIT HARTENBERG FOR NUMERICAL INPUTS
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import math
import transformation as transf

def denavit_hartenberg(dh_table, show_info):
    """
    Get transformation matrix from Denavit Hartenberg input table

    :param dh_matrix: main denavit hartenberg table size(N, 4)
    :param show_info: show information ("yes" or "no")
    :returns: transformation matrix size(4, 4)
    """
    TM = np.identity((4))

    # Get transformation matrix for each DH row (and keep multiplying it)
    for i in range(np.size(dh_table, 0)):
        TMi_0 = transf.Transformation(dh_table[i, 0], 0, 0, [0, 0, 0]).TM
        TMi_1 = transf.Transformation(0, 0, 0, [dh_table[i, 1], 0, 0]).TM
        TMi_2 = transf.Transformation(0, 0, 0, [0, 0, dh_table[i, 2]]).TM
        TMi_3 = transf.Transformation(0, 0, dh_table[i, 3], [0, 0, 0]).TM

        TM_current = np.dot(np.dot(np.dot(TMi_0, TMi_1), TMi_2), TMi_3)
        TM = np.dot(TM, TM_current)

        if (show_info == "yes" or show_info == 1):
            print("TMi_0 -", i, "\n", TMi_0)
            print("TMi_1 -", i, "\n", TMi_1)
            print("TMi_2 -", i, "\n", TMi_2)
            print("TMi_3 -", i, "\n", TMi_3)
            print("TM_current -", i, "\n", TM_current)
            print("TM -", i, "\n", TM, "\n\n")
    
    return TM


# TESTS
if __name__ == "__main__":
    # Get all constants for the distances and transformations for Baxter
    import constants_baxter
    Constants = constants_baxter.GetConstants()
    L0 = Constants.L0
    L1 = Constants.L1
    L2 = Constants.L2
    L3 = Constants.L3
    L4 = Constants.L4
    L5 = Constants.L5
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


    # ---------------TEST 1 (real Baxter values)--------------
    theta1 = math.radians(0)
    theta2 = math.radians(0)
    theta4 = math.radians(0)
    theta5 = math.radians(0)
    theta6 = math.radians(0)
    theta7 = math.radians(0)

    DH = np.array([[0, 0, 0, theta1],
                [-math.pi/2, L1, 0, theta2],
                [0, LH,  0, theta4 + math.pi/2],
                [math.pi/2, 0, L4, theta5],
                [-math.pi/2, L5, 0, theta6],
                [math.pi/2, 0, 0, theta7]])

    TM_0_6 = denavit_hartenberg(DH, "no")
    TM_W0_GL = np.dot(np.dot(np.dot(TM_W0_BL, TM_BL_0), TM_0_6), TM_7_GL)

    print("\n --------- TEST 1 ----------------")
    print("\n TM_06: \n", TM_0_6)
    print("\n TM_W0_GL: \n", TM_W0_GL)


    # ---------------TEST 2 (real Baxter values)--------------
    theta1 = math.radians(10)
    theta2 = math.radians(20)
    theta4 = math.radians(40)
    theta5 = math.radians(50)
    theta6 = math.radians(60)
    theta7 = math.radians(70)

    DH = np.array([[0, 0, 0, theta1],
                [-math.pi/2, L1, 0, theta2],
                [0, LH,  0, theta4 + math.pi/2],
                [math.pi/2, 0, L4, theta5],
                [-math.pi/2, L5, 0, theta6],
                [math.pi/2, 0, 0, theta7]])

    TM_0_6 = denavit_hartenberg(DH, "no")
    TM_W0_GL = np.dot(np.dot(np.dot(TM_W0_BL, TM_BL_0), TM_0_6), TM_7_GL)

    print("\n --------- TEST 2 ----------------")
    print("\n TM_06: \n", TM_0_6)
    print("\n TM_W0_GL: \n", TM_W0_GL)
