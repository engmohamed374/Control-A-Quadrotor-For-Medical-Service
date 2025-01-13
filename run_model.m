%% INFO
%%%%%%%%%%%%%% Author:  Mohamed Eid %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Version: 1.0         %%%%%%%%%%%%%%%%

%% States & Parameters

clear
clc

% Define parameters
Parameters

%% Trajectory

% Generate tajectories
circular_trajectory;

%% Simulation

% Run system
Data = sim('..\Simulink Models\Quadcopter_CTC');

%% Visulization

% Path
f1 = figure('Name','Path','NumberTitle','off');
plot3(Data.X.Data, Data.Y.Data, Data.Z.Data(:,2), 'lineWidth',3)
grid on
title('Quadcopter Trajectory')
xlabel('X Position')
ylabel('Y Position')
zlabel('Z Position')

% X_Direction
f = figure('Name','X_Direction','NumberTitle','off');
f.Position = [50 0 1500 400];
subplot (1, 3, 1)
plot (Data.X.Time, Data.X.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Actual Position')
subplot (1, 3, 2)
plot (Data.X.Time, Data.Xd.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Actual Velocity')
subplot (1, 3, 3)
plot (Data.X.Time, Data.Xdd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Actual Acceleration')

% Y_Direction
f = figure('Name','Y_Direction','NumberTitle','off');
f.Position = [50 0 1500 400];
subplot (1, 3, 1)
plot (Data.Y.Time, Data.Y.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Actual Position')
subplot (1, 3, 2)
plot (Data.Y.Time, Data.Yd.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Actual Velocity')
subplot (1, 3, 3)
plot (Data.Y.Time, Data.Ydd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Actual Acceleration')

% Hovering
f = figure('Name','Hovering','NumberTitle','off');
f.Position = [50 0 1500 800];
subplot (2, 3, 1)
plot (Data.Z.Time, Data.Z.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Desired Altitude','Actual Altitude')
subplot (2, 3, 2)
plot (Data.Z.Time, Data.Zd.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Desired Velocity','Actual Velocity')
subplot (2, 3, 3)
plot (Data.Z.Time, Data.Zdd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Desired Acceleration','Actual Acceleration')
subplot (2, 3, 4)
plot (Data.Z.Time, Data.Z.Data(:,1)-Data.Z.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Position Error')
subplot (2, 3, 5)
plot (Data.Z.Time, Data.Zd.Data(:,1)-Data.Zd.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Velocity Error')
subplot (2, 3, 6)
plot (Data.Z.Time, Data.Zdd.Data(:,1)-Data.Zdd.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Acceleration Error')

% Roll
f = figure('Name','Roll','NumberTitle','off');
f.Position = [50 0 1500 800];
subplot (2, 3, 1)
plot (Data.phi.Time, Data.phi.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Desired Roll','Actual Roll')
subplot (2, 3, 2)
plot (Data.phi.Time, Data.phi_d.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Desired Velocity','Actual Velocity')
subplot (2, 3, 3)
plot (Data.phi.Time, Data.phi_dd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Desired Acceleration','Actual Acceleration')
subplot (2, 3, 4)
plot (Data.phi.Time, Data.phi.Data(:,1)-Data.phi.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Position Error')
subplot (2, 3, 5)
plot (Data.phi.Time, Data.phi_d.Data(:,1)-Data.phi_d.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Velocity Error')
subplot (2, 3, 6)
plot (Data.phi.Time, Data.phi_dd.Data(:,1)-Data.phi_dd.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Acceleration Error')

% Pitch
f = figure('Name','Pitch','NumberTitle','off');
f.Position = [50 0 1500 800];
subplot (2, 3, 1)
plot (Data.theta.Time, Data.theta.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Desired Pitch','Actual Pitch')
subplot (2, 3, 2)
plot (Data.theta.Time, Data.theta_d.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Desired Velocity','Actual Velocity')
subplot (2, 3, 3)
plot (Data.theta.Time, Data.theta_dd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Desired Acceleration','Actual Acceleration')
subplot (2, 3, 4)
plot (Data.theta.Time, Data.theta.Data(:,1)-Data.theta.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Position Error')
subplot (2, 3, 5)
plot (Data.theta.Time, Data.theta_d.Data(:,1)-Data.theta_d.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Velocity Error')
subplot (2, 3, 6)
plot (Data.theta.Time, Data.theta_dd.Data(:,1)-Data.theta_dd.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Acceleration Error')

% Yaw
f = figure('Name','Yaw','NumberTitle','off');
f.Position = [50 0 1500 800];
subplot (2, 3, 1)
plot (Data.psi.Time, Data.psi.Data)
grid
xlabel ('Time(sec)')
ylabel('Position')
legend('Desired Yaw','Actual Yaw')
subplot (2, 3, 2)
plot (Data.psi.Time, Data.psi_d.Data)
grid
xlabel ('Time(sec)')
ylabel('Velocity')
legend('Desired Velocity','Actual Velocity')
subplot (2, 3, 3)
plot (Data.psi.Time, Data.psi_dd.Data)
grid
xlabel ('Time(sec)')
ylabel('Acceleration')
legend('Desired Acceleration','Actual Acceleration')
subplot (2, 3, 4)
plot (Data.psi.Time, Data.psi.Data(:,1)-Data.psi.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Position Error')
subplot (2, 3, 5)
plot (Data.psi.Time, Data.psi_d.Data(:,1)-Data.psi_d.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Velocity Error')
subplot (2, 3, 6)
plot (Data.psi.Time, Data.psi_dd.Data(:,1)-Data.psi_dd.Data(:,2))
grid
xlabel ('Time(sec)')
ylabel('Acceleration Error')
