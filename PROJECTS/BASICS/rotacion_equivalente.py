# ROBOTICS: MODULE TO GET AND EQUIVALENT ROTATION MATRIX
# Santiago Garcia Arango

import numpy as np
import math

class RotacionEquivalente:
    """
    ROTATION MATRIX FROM EQUIVALENT AXIS FOR ROBOTICS. Santiago Garcia Arango.
    """
    def __init__(self, vector_K, angle):
        self.vector_K = vector_K
        self.angle = angle

        # Initialize rotation matrices in zero
        self.Rk = np.eye(3)
        self.create_rotation_matrix()


    def create_rotation_matrix(self):
        angle = math.radians(self.angle)  # Convert from degrees to radians
        Kx = self.vector_K[0]
        Ky = self.vector_K[1]
        Kz = self.vector_K[2]
        V0 = 1 - math.cos(angle)
        C = math.cos(angle)
        S = math.sin(angle)

        if True:
            self.Rk = np.array([
                [Kx*Kx*V0 + C, Kx*Ky*V0 - Kz*S, Kx*Kz*V0 + Ky*S],
                [Kx*Ky*V0 + Kz*S, Ky*Ky*V0 + C, Ky*Kz*V0 - Kx*S],
                [Kx*Kz*V0 - Ky*S, Ky*Kz*V0 + Kx*S, Kz*Kz*V0 + C],
            ])

class VectorEquivalente:
    def __init__(self, matriz_rotacion):
        Rk = matriz_rotacion

        try:
            self.angle = math.acos((Rk[0,0] + Rk[1,1] + Rk[2,2] - 1)/2)
        except:
            print("\nDOMINIO INVALIDO FUNCION ACOS")
            self.angle = 0

        cte = 1/(2*math.sin(self.angle))
        self.vector_k = cte*np.array([
            [Rk[2,1] - Rk[1,2]],
            [Rk[0,2] - Rk[2,0]],
            [Rk[1,0] - Rk[0,1]],
        ])

        self.angle = math.degrees(self.angle)


# TESTS
if __name__ == "__main__":
    # PRIMERA PRUEBA (Validando que coincidan con rotaciones previas)
    # parte 1: ROTACION
    vector_K = [1, 0, 0]
    angle = 30
    test = RotacionEquivalente(vector_K, angle)
    print("\nPRIMERA PRUEBA ([1, 0, 0], 30)\nRK:\n", test.Rk)

    # Parte 2: VECTOR EQUIVALENTE Y ANGULO
    Rk = test.Rk
    test = VectorEquivalente(Rk)
    print("\nangle_found:\n", test.angle)
    print("\nvector_found:\n", test.vector_k)

    # SEGUNDA PRUEBA (Validando que coincidan con rotaciones previas)
    # Parte 1: ROTACION
    vector_K = [0, 1, 0]
    angle = 60
    test = RotacionEquivalente(vector_K, angle)
    print("\SEGUNDA PRUEBA ([0, 1, 0], 60)\nRK:\n", test.Rk)

    # Parte 2: VECTOR EQUIVALENTE Y ANGULO
    Rk = test.Rk
    test = VectorEquivalente(Rk)
    print("\nRk:\n", test.angle)
    print("\nvector_found:\n", test.vector_k)


    # TERCERA PRUEBA
    # Parte 1: VECTOR EQUIVALENTE Y ANGULO
    vector_K = [0.7070, 0.707, 0]
    angle = 20
    test = RotacionEquivalente(vector_K, angle)
    print("\TERCERA PRUEBA ([0.7070, 0.7070, 0], 20)\nRK:\n", test.Rk)

    # Parte 2: VECTOR EQUIVALENTE Y ANGULO
    Rk = test.Rk
    test = VectorEquivalente(Rk)
    print("\nRk:\n", test.angle)
    print("\nvector_found:\n", test.vector_k)
