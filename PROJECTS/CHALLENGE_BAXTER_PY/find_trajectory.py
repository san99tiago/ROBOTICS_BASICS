#!/usr/bin/env python
# FIND 5TH ORDER TRAJECTORY INBETWEEN INITIAL AND FINAL POINT
# SANTIAGO GARCIA AND ELKIN GUERRA

import numpy as np
import math

def find_trajectory(var_initial, var_final, final_time):

    # Use input parameters for the variables needed
    var_o = var_initial
    var_f = var_final

    # Define the intitial conditions for the fifth order trajectory    
    var_d_o = 0
    var_d_f = 0
    var_dd_o = 0
    var_dd_f = 0

    tf = final_time

    # Apply constants for the fifth order trajectories (Robotic's Craig book)
    a0 = var_o
    a1 = var_d_o
    a2 = var_dd_o/2
    a3 = (20*var_f - 20*var_o - (8*var_d_f + 12*var_d_o)*tf - (3*var_dd_o - var_dd_f)*tf**2)/(2*tf**3)
    a4 = (30*var_o - 30*var_f + (14*var_d_f + 16*var_d_o)*tf + (3*var_dd_o - 2*var_dd_f)*tf**2)/(2*tf**4)
    a5 = (12*var_f - 12*var_o - (6*var_d_f + 6*var_d_o)*tf - (var_dd_o - var_dd_f)*tf**2)/(2*tf**5)


    # Initialize the vectors for the important variables of the robot
    t = np.linspace(0, tf, 50)
    var = np.zeros(np.size(t))        

    # Generate main position vectors based on the constants found
    for i in range(len(t)):
        var[i] = a0 + a1*t[i] + a2*(t[i])**2 + a3*(t[i])**3 + a4*(t[i])**4 + a5*(t[i])**5

    return var


# TESTS
if __name__ == "__main__":
    theta1 = find_trajectory(0.5, 1.5, 5)
    print("SIZE(theta1) = {}".format(np.size(theta1)))
    print("theta1 = \n{}".format(theta1))
