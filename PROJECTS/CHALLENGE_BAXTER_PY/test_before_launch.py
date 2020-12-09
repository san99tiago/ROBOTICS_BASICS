# MAIN SCRIPT TO TEST PROPER FILES BEFORE REAL BAXTER LAUNCH
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import math
import trajectory_A
import transformation
import inverse_kinematics
import constants_baxter

# Variable to show every print statement for testing
SHOW_RESULTS = True

# Get main vector for the trajectory
T1 = trajectory_A.TrajectoryA(5)
print("\n... Processing trajectory 1 ...\n")
vector_x = T1.vector_x
vector_y = T1.vector_y
vector_z = T1.vector_z
vector_angle_x = T1.vector_angle_x
vector_angle_y = T1.vector_angle_y
vector_angle_z = T1.vector_angle_z
print("\n... Done processing trajectory 1 ...\n")

# TM_test = transformation.Transformation(vector_angle_x[0], vector_angle_y[0], 
#             vector_angle_z[0], [vector_x[0], vector_y[0], vector_z[0]])
# print(TM_test.TM)
# THETAS = inverse_kinematics.inverse_kinematics_baxter(TM_test.TM, "left")
# print(THETAS)

# Get each vector of theta_i for all points
THETA_1 = []
THETA_2 = []
THETA_4 = []
THETA_5 = []
THETA_6 = []
THETA_7 = []

for i in range(len(vector_x)):
    TM_i = transformation.Transformation(vector_angle_x[i], vector_angle_y[i], 
                vector_angle_z[i], [vector_x[i], vector_y[i], vector_z[i]])

    THETAS_i = inverse_kinematics.inverse_kinematics_baxter(TM_i.TM, "left")

    THETA_1.append(float(THETAS_i[0]))
    THETA_2.append(float(THETAS_i[1]))
    THETA_4.append(float(THETAS_i[2]))
    THETA_5.append(float(THETAS_i[3]))
    THETA_6.append(float(THETAS_i[4]))
    THETA_7.append(float(THETAS_i[5]))

if SHOW_RESULTS == True:
    print("\n THETA_1: \n", np.rad2deg(THETA_1))
    print("\n max(THETA_1) =", max(np.rad2deg(THETA_1)))
    print("\n min(THETA_1) =", min(np.rad2deg(THETA_1)))
    print("\n THETA_2: \n", np.rad2deg(THETA_2))
    print("\n max(THETA_2) =", max(np.rad2deg(THETA_2)))
    print("\n min(THETA_2) =", min(np.rad2deg(THETA_2)))
    print("\n THETA_4: \n", np.rad2deg(THETA_4))
    print("\n max(THETA_4) =", max(np.rad2deg(THETA_4)))
    print("\n min(THETA_4) =", min(np.rad2deg(THETA_4)))
    print("\n THETA_5: \n", np.rad2deg(THETA_5))
    print("\n max(THETA_5) =", max(np.rad2deg(THETA_5)))
    print("\n min(THETA_5) =", min(np.rad2deg(THETA_5)))
    print("\n THETA_6: \n", np.rad2deg(THETA_6))
    print("\n max(THETA_6) =", max(np.rad2deg(THETA_6)))
    print("\n min(THETA_6) =", min(np.rad2deg(THETA_6)))
    print("\n THETA_7: \n", np.rad2deg(THETA_7))
    print("\n max(THETA_7) =", max(np.rad2deg(THETA_7)))
    print("\n min(THETA_7) =", min(np.rad2deg(THETA_7)))
