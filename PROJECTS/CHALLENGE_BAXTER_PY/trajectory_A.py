#!/usr/bin/env python
# TRAJECTORY IBETWEEN TWO STANDAR POINTS
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import find_trajectory as traj

class TrajectoryA:
    def __init__(self, final_time):
        tf = final_time

        # # Initial point for Baxter tool
        # x0 = 1.1141
        # y0 = -0.9001
        # z0 =  1.3644
        # angle_x0 = 0.7854
        # angle_y0 = 1.5708
        # angle_z0 = 0

        # # Final point for Baxter robot
        # xf = 1
        # yf = -0.5
        # zf =  2
        # angle_xf = 0.7854
        # angle_yf = 1.5708
        # angle_zf = 0

        # Initial point for Baxter tool
        x0 = 0.87
        y0 = -0.1
        z0 = 0.5
        angle_x0 = 2.74
        angle_y0 = 0.5784
        angle_z0 = -2.9

        # Final point for Baxter robot
        xf = 1.1140
        yf = -0.9
        zf = 1.37
        angle_xf = 0.7854
        angle_yf = 1.5708
        angle_zf = 0

        # Find vectors for each variables necessary for transformation matrices
        self.vector_x = traj.find_trajectory(x0, xf, tf)
        self.vector_y = traj.find_trajectory(y0, yf, tf)
        self.vector_z = traj.find_trajectory(z0, zf, tf)
        self.vector_angle_x = traj.find_trajectory(angle_x0, angle_xf, tf)
        self.vector_angle_y = traj.find_trajectory(angle_y0, angle_yf, tf)
        self.vector_angle_z = traj.find_trajectory(angle_z0, angle_zf, tf)


# TEST
if __name__ == "__main__":
    # -------------- TEST 1 ---------------------
    T1 = TrajectoryA(5)
    print("------------ TRAJECTORY 1 (X-Y-Z-ANG_X-ANG_Y-ANG_Z) ------------")
    print("\n vector_x: \n", T1.vector_x)
    print("\n vector_y: \n", T1.vector_y)
    print("\n vector_z: \n", T1.vector_z)
    print("\n vector_angle_x: \n", T1.vector_angle_x)
    print("\n vector_angle_y: \n", T1.vector_angle_y)
    print("\n vector_angle_z: \n", T1.vector_angle_z)
