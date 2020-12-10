#!/usr/bin/env python
# MAIN SCRIPT TO EXECUTE 
# SANTIAGO GARCIA AND ELKIN GUERRA

# My own imports
import trajectory_A
import transformation
import inverse_kinematics
import constants_baxter

# General imports
import numpy as np
import math
import time
import cv2
import cv_bridge

# ROS imports 
import rospy
import baxter_interface
from baxter_interface import CHECK_VERSION 
from baxter_core_msgs.msg import JointCommand
from sensor_msgs.msg import Image



class MainAction:
    """
    Main Class to move Baxter's left arm in desired trajectory from ...
    a given set of initial and final points and with inverse kinematics...
    approach to find every possible angle and apply them in a total of N ...
    points from end to end.
    """
    def __init__(self):
        # Initialize main node for publishing
        rospy.init_node('MainAction')
        rospy.loginfo('... Initializing MainAction node')

        # Enable baxter if it isn't already enabled
        baxter_interface.RobotEnable(CHECK_VERSION).state().enabled
        baxter_interface.RobotEnable(CHECK_VERSION).enable()

        # Get create main publisher for activating the Joint movements
        self.pub = rospy.Publisher('/robot/limb/left/joint_command', JointCommand , queue_size=10)

        # Create Class to control Baxter's Joints
        self.command = JointCommand()
        self.rate = rospy.Rate(70)

        # Variable to show every print statement for testing
        SHOW_RESULTS = False

        # Define screen pixels for Baxter's image (face LCD screen)
        h=600
        w=1024

        # Load image for the Baxter's screen
        img1 = cv2.imread("Tejada.png")

        # Resize the image to get to the maximum possible screen size
        img1 = cv2.resize(img1,(w, h), interpolation = cv2.INTER_CUBIC)

        # Create publisher for the Image that will be loaded to Baxter
        pub = rospy.Publisher('/robot/xdisplay', Image, latch=True, queue_size=1)

        # Define message that will be loaded to the Image-publisher
        msg1 = cv_bridge.CvBridge().cv2_to_imgmsg(img1, encoding="bgr8")

        # Publish the desired message that contains the image
        pub.publish(msg1)

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
        self.THETA_1 = []
        self.THETA_2 = []
        self.THETA_4 = []
        self.THETA_5 = []
        self.THETA_6 = []
        self.THETA_7 = []

        # Generate main trajectories finding each angle of the joints with IK
        for i in range(len(vector_x)):
            # Get each transformation matrix for all cartesian points given
            TM_i = transformation.Transformation(vector_angle_x[i], vector_angle_y[i], 
                    vector_angle_z[i], [vector_x[i], vector_y[i], vector_z[i]])

            # Get each THETA_i for each point with the inverse-kinematics
            THETAS_i = inverse_kinematics.inverse_kinematics_baxter(TM_i.TM, "left")

            # Create all vectors of THETA_i for all necessary points
            self.THETA_1.append(float(THETAS_i[0]))
            self.THETA_2.append(float(THETAS_i[1]))
            self.THETA_4.append(float(THETAS_i[2]))
            self.THETA_5.append(float(THETAS_i[3]))
            self.THETA_6.append(float(THETAS_i[4]))
            self.THETA_7.append(float(THETAS_i[5]))

        if SHOW_RESULTS == True:
            print("\n THETA_1: \n", np.rad2deg(self.THETA_1))
            print("\n max(THETA_1) =", max(np.rad2deg(self.THETA_1)))
            print("\n min(THETA_1) =", min(np.rad2deg(self.THETA_1)))
            print("\n THETA_2: \n", np.rad2deg(self.THETA_2))
            print("\n max(THETA_2) =", max(np.rad2deg(self.THETA_2)))
            print("\n min(THETA_2) =", min(np.rad2deg(self.THETA_2)))
            print("\n THETA_4: \n", np.rad2deg(self.THETA_4))
            print("\n max(THETA_4) =", max(np.rad2deg(self.THETA_4)))
            print("\n min(THETA_4) =", min(np.rad2deg(self.THETA_4)))
            print("\n THETA_5: \n", np.rad2deg(self.THETA_5))
            print("\n max(THETA_5) =", max(np.rad2deg(self.THETA_5)))
            print("\n min(THETA_5) =", min(np.rad2deg(self.THETA_5)))
            print("\n THETA_6: \n", np.rad2deg(self.THETA_6))
            print("\n max(THETA_6) =", max(np.rad2deg(self.THETA_6)))
            print("\n min(THETA_6) =", min(np.rad2deg(self.THETA_6)))
            print("\n THETA_7: \n", np.rad2deg(self.THETA_7))
            print("\n max(THETA_7) =", max(np.rad2deg(self.THETA_7)))
            print("\n min(THETA_7) =", min(np.rad2deg(self.THETA_7)))


    def gen_main_action(self):
        # Setup command mode (1 for position control)
        self.command.mode=1

        # Correct format for the "name" of the main publisher (see doc)
        name=['left_s0','left_s1','left_e0','left_e1','left_w0','left_w1','left_w2']

        # Send each point of trajectory and publish it with given rate
        for i in range(len(self.THETA_1)):
            # Generate and publish main JoinCommand actions
            self.command.command=[self.THETA_1[i],self.THETA_2[i],-0,self.THETA_4[i],self.THETA_5[i],self.THETA_6[i],self.THETA_7[i]]
            self.command.names=name
            self.pub.publish(self.command)

            # Apply the desired frecuency for the loop iterations
            self.rate.sleep()
            rospy.sleep(0.1)

            # Show specific commad send in terminal
            rospy.loginfo('{}'.format(self.command))         


if __name__ == '__main__':
    try:
        pub = MainAction()
        pub.gen_main_action()
    except rospy.ROSInterruptException:
        print('Error')
