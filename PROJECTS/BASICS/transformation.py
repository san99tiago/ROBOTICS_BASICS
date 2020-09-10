# ROBOTICS: MODULE TO APPLY A GENERAL TRANSFORMATION HOMOGENEOUS MATRIX
# Santiago Garcia Arango

import numpy as np
import math

class Transformation:
    """
    TRANSFORMATION MATRICES FOR ROBOTICS. Santiago Garcia Arango.
    angle_x = rotation of {B} with respect of {A} in "x" axis.
    angle_y = rotation of {B} with respect of {A} in "y" axis.
    angle_z = rotation of {B} with respect of {A} in "z" axis.
    vector_AB = vector from origin of {A} to origin of {B}.
    vector_BP = vector from origin of {B} to point "P".
    """
    def __init__(self, angle_x, angle_y, angle_z, vector_AB, vector_BP):
        # Add extra "1" to vector_AB
        vector_AB.append(1)
        self.vector_AB = np.transpose([vector_AB])

        # Add extra "1" to vector_BP
        vector_BP.append(1)
        self.vector_BP = np.transpose([vector_BP])

        # Initialize rotation matrices in zero
        self.RX = np.eye(3)
        self.RY = np.eye(3)
        self.RZ = np.eye(3)

        # Change the rotation matrices based on inputs
        self.create_rotation_matrix("x", angle_x)
        self.create_rotation_matrix("y", angle_y)
        self.create_rotation_matrix("z", angle_z)

        print("\nRX:\n", self.RX)
        print("\nRY:\n", self.RY)
        print("\nRZ:\n", self.RZ)

        # Create homogeneous transformation matrix
        self.create_transformation_matriz()

        # Find vector_AP (from main coordinate system to point B)
        self.vector_AP = np.dot(self.TM, self.vector_BP)


    def create_rotation_matrix(self, axis, angle):
        angle = math.radians(angle)  # Convert from degrees to radians

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
        R_ZYX = np.dot(np.dot(self.RZ, self.RY), self.RX)
        
        print("\nR_ZYX\n", R_ZYX)

        extra_zeros_perspective = np.array([[0, 0, 0]])
        self.TM = np.concatenate((R_ZYX, extra_zeros_perspective))
        self.TM = np.concatenate((self.TM, self.vector_AB), axis=1)

        print("\nTM:\n", self.TM)


# TESTS
if __name__ == "__main__":
    test = Transformation(0, 0, 30, [10, 5, 0], [3, 7, 0])
    print("\nvector_AP:\n", test.vector_AP)


