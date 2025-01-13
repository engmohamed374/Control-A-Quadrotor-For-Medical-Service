%% Trajecroty Positions

f1 = figure('Name','R_P_Z','NumberTitle','off');
subplot (3, 1, 1)
plot (Data.phi.Time, Data.phi.Data(:,1),'b','LineWidth',2)
hold
plot(Data.phi.Time, Data.phi.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Roll (rad)')
legend('Desired Roll','Actual Roll')
ylim([-0.15 0.15])
subplot (3, 1, 2)
plot (Data.theta.Time, Data.theta.Data(:,1),'b','LineWidth',2)
hold
plot(Data.theta.Time, Data.theta.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Pitch (rad)')
legend('Desired Pitch','Actual Pitch')
ylim([-0.15 0.15])
subplot (3, 1, 3)
plot (Data.Z.Time, Data.Z.Data(:,1),'b','LineWidth',2)
hold
plot(Data.Z.Time, Data.Z.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Z (m)')
legend('Desired Altitude','Actual Altitude')

%% Trajecroty Velocities

f2 = figure('Name','R_P_Z Velocities','NumberTitle','off');
subplot (3, 1, 1)
plot (Data.phi_d.Time, Data.phi_d.Data(:,1),'b','LineWidth',2)
hold
plot(Data.phi_d.Time, Data.phi_d.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Roll Velocity (rad/sec)')
legend('Desired Velocity','Actual Velocity')
ylim([-0.25 0.25])
subplot (3, 1, 2)
plot (Data.theta_d.Time, Data.theta_d.Data(:,1),'b','LineWidth',2)
hold
plot(Data.theta_d.Time, Data.theta_d.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Pitch Velocity (rad/sec)')
legend('Desired Velocity','Actual Velocity')
ylim([-0.25 0.25])
subplot (3, 1, 3)
plot (Data.Zd.Time, Data.Zd.Data(:,1),'b','LineWidth',2)
hold
plot(Data.Zd.Time, Data.Zd.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Z Velocity (m/sec)')
legend('Desired Velocity','Actual Velocity')
ylim([0 1.7])

%% Trajecroty Accelerations

f3 = figure('Name','R_P_Z Accelerations','NumberTitle','off');
subplot (3, 1, 1)
plot (Data.phi_dd.Time, Data.phi_dd.Data(:,1),'b','LineWidth',2)
hold
plot(Data.phi_dd.Time, Data.phi_dd.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Roll Acceleration (rad/sec^2)')
legend('Desired Acceleration','Actual Acceleration')
ylim([-1 1])
subplot (3, 1, 2)
plot (Data.theta_dd.Time, Data.theta_dd.Data(:,1),'b','LineWidth',2)
hold
plot(Data.theta_dd.Time, Data.theta_dd.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Pitch Acceleration (rad/sec^2)')
legend('Desired Acceleration','Actual Acceleration')
ylim([-1 1])
subplot (3, 1, 3)
plot (Data.Zdd.Time, Data.Zdd.Data(:,1),'b','LineWidth',2)
hold
plot(Data.Zdd.Time, Data.Zdd.Data(:,2),'r--','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Z Acceleration (m/sec^2)')
legend('Desired Acceleration','Actual Acceleration')
ylim([-1 1])

%% Trajecroty Errors

f4 = figure('Name','R_P_Z Errors','NumberTitle','off');
subplot (3, 1, 1)
plot (Data.phi.Time, Data.phi.Data(:,1) - Data.phi.Data(:,2),'b','LineWidth',2)
hold
plot(Data.theta.Time, Data.theta.Data(:,1) - Data.theta.Data(:,2),'r','LineWidth',2)
plot (Data.Z.Time, Data.Z.Data(:,1) - Data.Z.Data(:,2),'g','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Position Errors (rad-m)')
legend('Roll Error','Pitch Error','Z Error')
ylim([-0.05 0.05])
subplot (3, 1, 2)
plot (Data.phi_d.Time, Data.phi_d.Data(:,1) - Data.phi_d.Data(:,2),'b','LineWidth',2)
hold
plot(Data.theta_d.Time, Data.theta_d.Data(:,1) - Data.theta_d.Data(:,2),'r','LineWidth',2)
plot (Data.Zd.Time, Data.Zd.Data(:,1) - Data.Zd.Data(:,2),'g','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Position Errors (rad/sec-m/sec)')
legend('Roll Velocity Error','Pitch Velocity Error','Z Velocity Error')
ylim([-0.04 0.04])
subplot (3, 1, 3)
plot (Data.phi_dd.Time, Data.phi_dd.Data(:,1) - Data.phi_dd.Data(:,2),'b','LineWidth',2)
hold
plot(Data.theta_dd.Time, Data.theta_dd.Data(:,1) - Data.theta_dd.Data(:,2),'r','LineWidth',2)
plot (Data.Zdd.Time, Data.Zdd.Data(:,1) - Data.Zdd.Data(:,2),'g','LineWidth',2)
grid
xlabel ('Time (sec)')
ylabel('Position Errors (rad/sec^2-m/sec^2)')
legend('Roll Acceleration Error','Pitch Acceleration Error','Z Acceleration Error')
ylim([-0.25 0.25])

%% Path
f5 = figure('Name','Path','NumberTitle','off');
plot3(Data.X.Data, Data.Y.Data, Data.Z.Data(:,2), 'lineWidth',3)
grid
title('Quadcopter Trajectory')
xlabel('X Position')
ylabel('Y Position')
zlabel('Z Position')