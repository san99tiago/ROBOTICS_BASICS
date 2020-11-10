% QUIZ 2 ROBOTICA PARTE FINAL
% Santiago Garcia y Elkin Guerra
% -------------------------------
clc; clear all;
% Primera trayectoria
VMAX_LINEAL = 1*sin(pi/4); % VELOCIDAD MAXIMA LINEAL MOTOR
PASO = 0.02*(1/(2*pi))
VMAX_ANGULAR = VMAX_LINEAL/PASO % VELOCIDAD MAXIMA ANGULAR MOTOR (PARA TRAYECTORIAS)

% PRIMERA TRAYECTORIA (PARA ENCONTRAR VELOCIDADES Y ACELERACIONES CARTESIANAS)
disp("PRIMERA TRAYECTORIA");
[t, V1_x, A1_x, J1_x] = QUIZ_2_TRAYECTORIAS(0, VMAX_ANGULAR, 0.15, "1");
V1_y = V1_x;

figure();
plot(t, V1_x)
title("PERFIL VELOCIDADES TRAYECTORIA 1 MOTOR")

figure()
plot(t, A1_x)
title("PERFIL ACELERACIONES TRAYECTORIA 1 MOTOR")


% SEGUNDA TRAYECTORIA (PARA TRAYECTO LINEAL) EN CUADERNO
% Como es tan sencilla, no requiere calculo de trayectorias


% TERCERA TRAYECTORIA PARA VELOCIDADES Y ACELERACIONES MOTOR
disp("TERCERA TRAYECTORIA");
[t, V3_x, A3_x, J3_x] = QUIZ_2_TRAYECTORIAS(VMAX_ANGULAR, 0, 0.15, "1");
V3_y = V3_x;

figure()
plot(t, V3_x)
title("PERFIL VELOCIDADES TRAYECTORIA 3 MOTORES")

figure()
plot(t, A3_x)
title("PERFIL ACELERACIONES TRAYECTORIA 3 MOTORES")

%%
% POTENCIA NETA DEL MOTORES EN TRAYECOTORIA 1
T_M1_trayectoria_1 = 0.1402*A1_x;
P_M1_trayectoria_1 = V1_x.*T_M1_trayectoria_1;

T_M2_trayectoria_1 = 0.0708*A1_x;
P_M2_trayectoria_1 = V1_x.*T_M2_trayectoria_1;

figure()
plot(t, T_M1_trayectoria_1)
title("TORQUE MOTOR 1 TRAYECTORIA 1")

figure()
plot(t, T_M2_trayectoria_1)
title("TORQUE MOTOR 2 TRAYECTORIA 1")

figure()
plot(t, P_M1_trayectoria_1)
title("POTENCIA MOTOR 1 TRAYECTORIA 1")

figure()
plot(t, P_M2_trayectoria_1)
title("POTENCIA MOTOR 2 TRAYECTORIA 1")



% POTENCIA NETA DEL MOTORES EN TRAYECOTORIA 3 (debe ser equivalente pero
% con diferentes instantes en el tiempo por sus magnitudes de bajada)
T_M1_trayectoria_3 = 0.1402*A3_x;
P_M1_trayectoria_3 = V3_x.*T_M1_trayectoria_3;

T_M2_trayectoria_3 = 0.0708*A3_x;
P_M2_trayectoria_3 = V3_x.*T_M2_trayectoria_3;

figure()
plot(t, T_M1_trayectoria_3)
title("TORQUE MOTOR 1 TRAYECTORIA 3")

figure()
plot(t, T_M2_trayectoria_3)
title("TORQUE MOTOR 2 TRAYECTORIA 3")

figure()
plot(t, P_M1_trayectoria_3)
title("POTENCIA MOTOR 1 TRAYECTORIA 3")

figure()
plot(t, P_M2_trayectoria_3)
title("POTENCIA MOTOR 2 TRAYECTORIA 3")


