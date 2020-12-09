#!/usr/bin/env python
# CONSTANTS FOR THE NECESSARY BAXTER TRANSFORMATIONS
# LAB 5 ROBTICS GROUP 01

import math
import numpy as np


class GetConstants:
    """
    Get all necessary constants for all math operations in Baxter kinematics.

    :param None: No parameters required
    :returns: class-object to get each constant
    """
    def __init__(self):
        # Measurements of Baxter's distances (see given document)...
        # ... remember that theta3=0 and L5=0 for 6 DOF
        self.L0 = 0.27035
        self.L1 = 0.069
        self.L2 = 0.36435
        self.L3 = 0.069
        self.L4 = 0.37429
        self.L5 = 0.0
        self.L6 = 0.36830
        self.L = 0.278
        self.h = 0.064
        self.H = 1.104
        self.LH = math.sqrt(self.L2**2 + self.L3**2)

        # Transformation Matrices from origin {W0} to {BL} and {BR}
        self.TM_W0_BL = np.array([[math.sqrt(2)/2, math.sqrt(2)/2, 0,  self.L],
                            [-math.sqrt(2)/2, math.sqrt(2)/2, 0, -self.h],
                            [0, 0, 1, self.H],
                            [0, 0, 0, 1]])


        self.TM_W0_BR = np.array([[-math.sqrt(2)/2, math.sqrt(2)/2, 0, -self.L],
                            [-math.sqrt(2)/2, -math.sqrt(2)/2, 0, -self.h],
                            [0, 0, 1, self.H],
                            [0, 0, 0, 1]])


        # Transformation Matrices from {BL} and {BR} to coordinates {0}
        self.TM_BL_0 = np.array([[1, 0, 0,  0],
                            [0, 1, 0,  0],
                            [0, 0, 1, self.L0],
                            [0, 0, 0,  1]])
        self.TM_BR_0 = self.TM_BL_0


        # Transformation Matrices from {7} to coordinates of tools {GR} and {GL}
        self.TM_7_GL = np.array([[1, 0, 0,  0],
                            [0, 1, 0,  0],
                            [0, 0, 1, self.L6],
                            [0, 0, 0,  1]])
        self.TM_7_GR = self.TM_7_GL


if __name__ == "__main__":
    # Main way to test that the constants are okay, is to check them
    Constants = GetConstants()

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

    print("L0 = {}".format(L0))
    print("L1 = {}".format(L1))
    print("L2 = {}".format(L2))
    print("L3 = {}".format(L3))
    print("L4 = {}".format(L4))
    print("L5 = {}".format(L5))
    print("L6 = {}".format(L6))
    print("L  = {}".format(L))
    print("h  = {}".format(h))
    print("H  = {}".format(H))
    print("LH = {}".format(LH))
    print("TM_W0_BL = \n{}".format(TM_W0_BL))
    print("TM_W0_BR = \n{}".format(TM_W0_BR))
    print("TM_BL_0 = \n{}".format(TM_BL_0))
    print("TM_BR_0 = \n{}".format(TM_BR_0))
    print("TM_7_GL = \n{}".format(TM_7_GL))
    print("TM_7_GR = \n{}".format(TM_7_GR))
