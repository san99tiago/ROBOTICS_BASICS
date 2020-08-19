# ROBOTICS: MODULE TO APPLY A GENERAL TRANSFORMATION HOMOGENEOUS MATRIX
# Santiago Garcia Arango

import numpy as np
import math

class Transformation:
    def __init__(self, angle_x, angle_y, angle_z, vector_AB, vector_BP):
        # Add extra "1" to vector_AB
        vector_AB.append(1)
        self.vector_AB = np.array(vector_AB)
        self.vector_AB = np.transpose([vector_AB])

        print(self.vector_AB)

        # Initialize rotation matrices in zero
        self.RX = np.eye(3)
        self.RY = np.eye(3)
        self.RZ = np.eye(3)

        print("\nRX:\n", self.RX)
        print("\nRY:\n", self.RY)
        print("\nRZ:\n", self.RZ)

        # Change the rotation matrices based on inputs
        self.create_rotation_matrix("x", angle_x)
        self.create_rotation_matrix("y", angle_y)
        self.create_rotation_matrix("z", angle_z)

        print("\nRX:\n", self.RX)
        print("\nRY:\n", self.RY)
        print("\nRZ:\n", self.RZ)

        # Create homogeneous transformation matrix
        self.create_transformation_matriz()


    def create_rotation_matrix(self, axis, angle):
        angle = math.radians(angle)  # Convert from degrees to radians
        if axis == "z":
            self.RZ = np.array([
                [math.cos(angle), -math.sin(angle), 0],
                [math.sin(angle), math.cos(angle), 0],
                [0, 0, 1]
            ])
        # if axis == "z":
        #     self.RX = np.array[
        #         [math.cos(angle), -math.sin(angle), 0]
        #         [math.sin(angle), math.cos(angle), 0]
        #         [0, 0, 1]
        #     ]
        # if axis == "z":
        #     self.RX = np.array[
        #         [math.cos(angle), -math.sin(angle), 0]
        #         [math.sin(angle), math.cos(angle), 0]
        #         [0, 0, 1]
        #     ]
    
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







# angle = math.radians(30)

# AB_transformation = np.array([
#     [math.cos(angle), -math.sin(angle), 0, 10],
#     [math.sin(angle), math.cos(angle), 0, 5],
#     [0, 0, 1, 0],
#     [0, 0, 0, 1],
# ])

# print(AB_transformation)

# B_PA = np.array([3,7,0,1])

# A_P = np.dot(AB_transformation, B_PA.transpose())


# print(A_P)
