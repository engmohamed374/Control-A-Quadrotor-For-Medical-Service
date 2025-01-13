%% INFO
%%%%%%%%%%%%%% Author:  Mohamed Eid %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Version: 1.0         %%%%%%%%%%%%%%%%

%% States & Parameters

clear
clc

% Define parameters
Parameters

% Set variables
syms q1 qd1 qdd1
syms q2 qd2 qdd2
syms q3 qd3 qdd3
syms q4 qd4 qdd4
syms q5 qd5 qdd5
syms q6 qd6 qdd6
syms phi theta psi
syms Wp_1 Wp_2 Wp_3 Wp_4
syms T3 T4 T5 T6

% Define matrices
qd = [qd1;qd2;qd3;qd4;qd5;qd6];

M = [mQ 0  0  0    0    0;
     0  mQ 0  0    0    0;
     0  0  mQ 0    0    0;
     0  0  0  IQ_x 0    0;
     0  0  0  0    IQ_y 0;
     0  0  0  0    0    IQ_z];

C = [Kt_x   0       0       0                                       0                                       0;
     0      Kt_y    0       0                                       0                                       0;
     0      0       Kt_z    0                                       0                                       0;
     0      0       0       Kr_x*qd4                                -qd6*IQ_z+Ip_z*(-Wp_1+Wp_2-Wp_3+Wp_4)   qd5*IQ_y;
     0      0       0       qd6*IQ_z-Ip_z*(-Wp_1+Wp_2-Wp_3+Wp_4)    Kr_y*qd5                                -qd4*IQ_x;
     0      0       0       -qd5*IQ_y                               qd4*IQ_x                                Kr_z*qd6];

G = [0;0;mQ*g;0;0;0];

T = [Kf*(cos(psi)*sin(theta)*cos(phi)+sin(psi)*sin(phi))*(Wp_1^2+Wp_2^2+Wp_3^2+Wp_4^2);
     Kf*(sin(psi)*sin(theta)*cos(phi)-cos(psi)*sin(phi))*(Wp_1^2+Wp_2^2+Wp_3^2+Wp_4^2);
     Kf*(cos(theta)*cos(phi))*(Wp_1^2+Wp_2^2+Wp_3^2+Wp_4^2);
     Kf*l*(Wp_2^2-Wp_4^2);
     Kf*l*(Wp_3^2-Wp_1^2);
     Kd*(Wp_1^2-Wp_2^2+Wp_3^2-Wp_4^2)];

H = [Kf*(cos(theta)*cos(phi))   Kf*(cos(theta)*cos(phi))    Kf*(cos(theta)*cos(phi))    Kf*(cos(theta)*cos(phi));
     0                          Kf*l                        0                           -Kf*l;
     -Kf*l                      0                           Kf*l                        0;
     Kd                         -Kd                         Kd                          -Kd];

%% Inverse Dynamics

% Calculate inverse dynamics equation
qdd = M\(T - (C*qd + G));
qdd = simplify(qdd);

% Display Matrix
disp('qdd = ');
disp(qdd);

%% Non-linearity Matrix

% Generate non-linearity matrix
N = C*qd + G;
N = simplify(N);

%Display Matrix
disp('N = ');
disp(N);

%% Torque Mapping Matrix

% Generate torque mapping matrix
Wp = H\[T3;T4;T5;T6];
Wp = simplify(Wp);

%Display Matrix
disp('Wp = ');
disp(Wp);