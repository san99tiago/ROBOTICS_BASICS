# ROBOTICS
# WORKING WITH POSITION OF POINTS BETWEEN TWO DIFFERENT SPACES
# Santiago Garcia Arango

import numpy as np
import math

angle = math.radians(30)

AB_transformation = np.array([
    [math.cos(angle), -math.sin(angle), 0, 10],
    [math.sin(angle), math.cos(angle), 0, 5],
    [0, 0, 1, 0],
    [0, 0, 0, 1],
])

print(AB_transformation)

B_PA = np.array([3,7,0,1])

A_P = np.dot(AB_transformation, B_PA.transpose())


print(A_P)
