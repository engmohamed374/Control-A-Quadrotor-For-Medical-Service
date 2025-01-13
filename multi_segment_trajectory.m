function [total_trajectory_ts] = multi_segment_trajectory(num_segments, p0, v0, a0, t0, step_size, final_data)
    % multi_segment_trajectory - Generates a multi-segment 5th-order polynomial
    % representing the overall trajectory of motion.
    %
    % Inputs:
    %   num_segments - Total number of segments (small trajectories)
    %   p0           - Initial position for the first trajectory
    %   v0           - Initial velocity for the first trajectory
    %   a0           - Initial acceleration for the first trajectory
    %   t0           - Initial time for the first trajectory
    %   step_size    - Step size for time vector
    %   final_data   - A matrix with [pf, vf, af, tf] for each trajectory, size is (num_segments x 3)
    %
    % Outputs:
    %   total_trajectory_ts - A combined timeseries object of all trajectories

    % Initialize the overall time and trajectory arrays
    total_time = zeros([(final_data(num_segments, 4) - t0) / step_size, 1]);
    total_trajectory = total_time;

    % Loop through the number of segments
    for i = 1:num_segments
        % For the first trajectory, use the provided initial values (p0, v0, a0)
        if i == 1
            % Final data for the first trajectory
            pf = final_data(i, 1);
            vf = final_data(i, 2);
            af = final_data(i, 3);
            tf = final_data(i, 4);

            % Generate the first trajectory
            [~, segment_ts] = fifth_order_trajectory(p0, pf, v0, vf, a0, af, t0, tf, step_size);

        else
            % For subsequent trajectories, the initial values are the final values of the previous segment
            p0 = final_data(i-1, 1);  % Initial position is the final position of the previous trajectory
            v0 = final_data(i-1, 2);  % Initial velocity is the final velocity of the previous trajectory
            a0 = final_data(i-1, 3);  % Initial acceleration is the final acceleration of the previous trajectory
            t0 = final_data(i-1, 4);  % Initial time is the final time of the previous trajectory

            % Update the final values for this trajectory
            pf = final_data(i, 1);
            vf = final_data(i, 2);
            af = final_data(i, 3);
            tf = final_data(i, 4);
            
            % Generate the trajectory for this segment
            [~, segment_ts] = fifth_order_trajectory(p0, pf, v0, vf, a0, af, t0, tf, step_size);
            
            % Remove the last point since it is the first point of the next trajectory
            segment_ts = delsample(segment_ts,'Index',length(segment_ts));
        end
        
        % Append the time and trajectory of this segment to the total time and trajectory
        total_time((t0/step_size + 1):tf/step_size + 1*( i == 1)) = segment_ts.Time;  % Append time vector
        total_trajectory((t0/step_size + 1):tf/step_size + 1*( i == 1)) = segment_ts.Data;  % Append position data
    end

    % Create a timeseries object for the combined trajectory
    total_trajectory_ts = timeseries(total_trajectory, total_time);

    % Plot the entire trajectory for visualization
    figure;
    plot(total_trajectory_ts.Time, total_trajectory_ts.Data, 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Position');
    title('Multi-Segment 5th-Order Polynomial Trajectory');
    grid on;

end