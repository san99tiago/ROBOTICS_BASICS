#!/usr/bin/env python
# MAIN SCRIPT TO EXECUTE 
# SANTIAGO GARCIA AND ELKIN GUERRA


# ---------------------------------------------------------

# IMPORTANT REMARK:
# THIS FILE WAS THE FIRST ATTEMPT USING BAXTER_INTERFACE.
# THE RESULT WASN'T SUCCESSFULL IN GAZEBO SIMULATOR.
# CHECK "MAIN" FOR REAL FUNCTIONAL FILE.

# ---------------------------------------------------------


import numpy as np
import math
import trajectory_A
import transformation
import inverse_kinematics
import constants_baxter
import time
# ROS imports 
import rospy
import baxter_interface
from baxter_interface import CHECK_VERSION 

class Espiral:
    def __init__(self):
        rospy.init_node('espiral')
        rospy.loginfo('Se inicio nodo espiral')
        # Se activan las articulaciones del robot
        baxter_interface.RobotEnable(CHECK_VERSION).state().enabled
        baxter_interface.RobotEnable(CHECK_VERSION).enable()

        # Se inicializan las instancias limb
        self.limbi = baxter_interface.Limb('left')
        self.rate = rospy.Rate(100)


    def gen_espiral(self):
        # Variable to show every print statement for testing
        SHOW_RESULTS =False

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
        izq0 =  {'left_w0': THETA_5[0], 'left_w1': THETA_6[0], 'left_w2': THETA_7[0], 'left_e0': 0, 'left_e1': THETA_4[0], 'left_s0': THETA_1[0], 'left_s1': THETA_2[0]}
        self.limbi.move_to_joint_positions(izq0)
        #VP1
        izq1 =  {'left_w0': THETA_5[9], 'left_w1': THETA_6[9], 'left_w2': THETA_7[9], 'left_e0': 0, 'left_e1': THETA_4[9], 'left_s0': THETA_1[9], 'left_s1': THETA_2[9]}
        self.limbi.move_to_joint_positions(izq1)

        #VP2
        izq2 =  {'left_w0': THETA_5[19], 'left_w1': THETA_6[19], 'left_w2': THETA_7[19], 'left_e0': 0, 'left_e1': THETA_4[19], 'left_s0': THETA_1[19], 'left_s1': THETA_2[19]}
        self.limbi.move_to_joint_positions(izq2)

        #VP3
        izq3 =  {'left_w0': THETA_5[29], 'left_w1': THETA_6[29], 'left_w2': THETA_7[29], 'left_e0': 0, 'left_e1': THETA_4[29], 'left_s0': THETA_1[29], 'left_s1': THETA_2[29]}
        self.limbi.move_to_joint_positions(izq3)

        #ir al centro
        izq5 =  {'left_w0': THETA_5[39], 'left_w1': THETA_6[39], 'left_w2': THETA_7[39], 'left_e0': 0, 'left_e1': THETA_4[39], 'left_s0': THETA_1[39], 'left_s1': THETA_2[39]}
        self.limbi.move_to_joint_positions(izq5)

        #preparacion
        izq6 =  {'left_w0': THETA_5[49], 'left_w1': THETA_6[49], 'left_w2': THETA_7[49], 'left_e0': 0, 'left_e1': THETA_4[49], 'left_s0': THETA_1[49], 'left_s1': THETA_2[49]}
        self.limbi.move_to_joint_positions(izq6)


if __name__ == '__main__':
    try:
        pub = Espiral()
        pub.gen_espiral()
    except rospy.ROSInterruptException:
        print('Error')
