%% INFO
%%%%%%%%%%%%%% Author:  Mohamed Eid %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Version: 1.0         %%%%%%%%%%%%%%%%

p0 = 0;  % Initial position
v0 = 0;  % Initial velocity
a0 = 0;  % Initial acceleration
t0 = 0;  % Initial time
step_size = 0.001; % Step size for the time vector

% Hovering
num_segments = 2;  % Number of trajectory segments
final_data = [5, 1, 0, 5;       % First trajectory final position, velocity, acceleration, time
              40, 1, 0, 40];    % Second trajectory

Z_trajectory_ts = multi_segment_trajectory(num_segments, p0, v0, a0, t0, step_size, final_data);

% Roll
num_segments = 7;  % Number of trajectory segments
final_data = [0, 0, 0, 13;      % First trajectory final position, velocity, acceleration, time
              -0.1, 0, 0, 14;   % Second trajectory
              -0.1, 0, 0, 18;   % Third trajectory
              0.1, 0, 0, 20;    % Fourth trajectory
              0.1, 0, 0, 29;    % Fifth trajectory
              -0.1, 0, 0, 31;   % Sixth trajectory
              -0.1, 0, 0, 40];  % Seventh trajectory
%               0.1, 0, 0, 42;    % Eigth trajectory
%               0.1, 0, 0, 51;    % Ninth trajectory
%               -0.1, 0, 0, 53;   % Tenth trajectory
%               -0.1, 0, 0, 62;   % Eleventh trajectory
%               0.1, 0, 0, 64;    % Twelvth trajectory
%               0.1, 0, 0, 73;    % Thirteenh trajectory
%               -0.1, 0, 0, 75;   % Fourteenth trajectory
%               -0.1, 0, 0, 84;   % Fifteenth trajectory
%               0.1, 0, 0, 86;    % Sixteenth trajectory
%               0.1, 0, 0, 95;    % Seventeenth trajectory
%               -0.1, 0, 0, 97;   % Eighteenth trajectory
%               -0.1, 0, 0, 100]; % Ninteenth trajectory

Roll_trajectory_ts = multi_segment_trajectory(num_segments, p0, v0, a0, t0, step_size, final_data);

% Pitch
num_segments = 9;  % Number of trajectory segments
final_data = [0, 0, 0, 7;       % First trajectory final position, velocity, acceleration, time
              -0.1, 0, 0, 8;    % Second trajectory
              -0.1, 0, 0, 12;   % Third trajectory
              0.1, 0, 0, 14;    % Fourth trajectory
              0.1, 0, 0, 23;    % Fifth trajectory
              -0.1, 0, 0, 25;   % Sixth trajectory
              -0.1, 0, 0, 34;   % Seventh trajectory
              0.1, 0, 0, 36;    % Eigth trajectory
              0.1, 0, 0, 40];   % Ninth trajectory
%               -0.1, 0, 0, 47;   % Tenth trajectory
%               -0.1, 0, 0, 56;   % Eleventh trajectory
%               0.1, 0, 0, 58;    % Twelvth trajectory
%               0.1, 0, 0, 67;    % Thirteenh trajectory
%               -0.1, 0, 0, 69;   % Fourteenth trajectory
%               -0.1, 0, 0, 78;   % Fifteenth trajectory
%               0.1, 0, 0, 80;    % Sixteenth trajectory
%               0.1, 0, 0, 89;    % Seventeenth trajectory
%               -0.1, 0, 0, 91;   % Eighteenth trajectory
%               -0.1, 0, 0, 100]; % Ninteenth trajectory

Pitch_trajectory_ts = multi_segment_trajectory(num_segments, p0, v0, a0, t0, step_size, final_data);
