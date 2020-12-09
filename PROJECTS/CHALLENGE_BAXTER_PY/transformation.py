#!/usr/bin/env python
# GET TRANSFORMATION MATRIX FROM FIXED-ANGLES ROTATIONS AND A TRANSLATION
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import math


class Transformation:
    """
    Get transformation matrix from fixed-angles rotations and a translation.

    :returns: transformation matrix size(4, 4)
    :param angle_x: rotation of {B} with respect of {A} in "x" axis.
    :param angle_y: rotation of {B} with respect of {A} in "y" axis.
    :param angle_z: rotation of {B} with respect of {A} in "z" axis.
    :param vector_AB: vector from origin of {A} to origin of {B}.
    """

    def __init__(self, angle_x, angle_y, angle_z, vector_AB):
        # Add extra "1" to vector_AB
        vector_AB.append(1)
        self.vector_AB = np.transpose([vector_AB])

        # Initialize rotation matrices in zero
        self.RX = np.eye(3)
        self.RY = np.eye(3)
        self.RZ = np.eye(3)

        # Change the rotation matrices based on inputs
        self.create_rotation_matrix("x", angle_x)
        self.create_rotation_matrix("y", angle_y)
        self.create_rotation_matrix("z", angle_z)

        # Create homogeneous transformation matrix
        self.create_transformation_matriz()

    def create_rotation_matrix(self, axis, angle):

        if axis == "x":
            self.RX = np.array([
                [1, 0, 0],
                [0, math.cos(angle), -math.sin(angle)],
                [0, math.sin(angle), math.cos(angle)]
            ])

        if axis == "y":
            self.RY = np.array([
                [math.cos(angle), 0, math.sin(angle)],
                [0, 1, 0],
                [-math.sin(angle), 0, math.cos(angle)]
            ])

        if axis == "z":
            self.RZ = np.array([
                [math.cos(angle), -math.sin(angle), 0],
                [math.sin(angle), math.cos(angle), 0],
                [0, 0, 1]
            ])
    
    def create_transformation_matriz(self):
        # Get rotation matrix with fixed angles approach (Rxyz = Rz.Ry.Rx)
        R_ZYX = np.dot(np.dot(self.RZ, self.RY), self.RX)

        extra_zeros_perspective = np.array([[0, 0, 0]])
        self.TM = np.concatenate((R_ZYX, extra_zeros_perspective))
        self.TM = np.concatenate((self.TM, self.vector_AB), axis=1)


# TESTS
if __name__ == "__main__":
    test = Transformation(0, 0, math.radians(30), [10, 5, 0])
    print("\nRX:\n", test.RX)
    print("\nRY:\n", test.RY)
    print("\nRZ:\n", test.RZ)
    print("\nTM:\n", test.TM)

    test = Transformation(0, 0, math.radians(90), [1, 2, 3])
    print("\nRX:\n", test.RX)
    print("\nRY:\n", test.RY)
    print("\nRZ:\n", test.RZ)
    print("\nTM:\n", test.TM)
