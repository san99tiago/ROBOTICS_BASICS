import sympy
import numpy
import numpy as np

import rotacion_equivalente_sym

theta, phi = sympy.symbols("theta phi")


vector_K = [1, 0, 0]
angle = phi
test = rotacion_equivalente_sym.RotacionEquivalente(vector_K, angle)

print(test.Rk)
print(np.shape(test.Rk))

for i in range(np.shape(test.Rk)[0]):
    for j in range(np.shape(test.Rk)[1]):
        test.Rk[i, j] = test.Rk[i, j].subs([(angle, 0)])

print(test.Rk)