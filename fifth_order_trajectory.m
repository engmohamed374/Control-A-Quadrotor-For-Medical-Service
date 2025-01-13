function [coefficients, trajectory_ts] = fifth_order_trajectory(p0, pf, v0, vf, a0, af, t0, tf, step_size)
    % fifth_order_trajectory - Generates a 5th-order polynomial equation 
    % representing the trajectory of motion and outputs it as a time series.
    %
    % Inputs:
    %   p0        - Initial position
    %   pf        - Final position
    %   v0        - Initial velocity
    %   vf        - Final velocity
    %   a0        - Initial acceleration
    %   af        - Final acceleration
    %   t0        - Initial time
    %   tf        - Final time
    %   step_size - Step size for time vector
    %
    % Outputs:
    %   coefficients - Coefficients of the 5th-order polynomial [a5, a4, a3, a2, a1, a0]
    %   trajectory_ts - A timeseries object containing the time and position values

    % Time duration
    T = tf - t0;
    
    % Setting up the system of equations to solve for the coefficients
    % The equation is: p(t) = a5*t^5 + a4*t^4 + a3*t^3 + a2*t^2 + a1*t + a0
    
    % We need to form 6 equations with 6 unknowns (a5, a4, a3, a2, a1, a0)
    % The conditions are set based on the boundary conditions:
    %   1. Initial position: p(t0) = p0
    %   2. Final position: p(tf) = pf
    %   3. Initial velocity: p'(t0) = v0
    %   4. Final velocity: p'(tf) = vf
    %   5. Initial acceleration: p''(t0) = a0
    %   6. Final acceleration: p''(tf) = af

    % Matrix of equations (Left-hand side)
    A = [t0^5, t0^4, t0^3, t0^2, t0, 1;  % Position at t0
         tf^5, tf^4, tf^3, tf^2, tf, 1;  % Position at tf
         5*t0^4, 4*t0^3, 3*t0^2, 2*t0, 1, 0;  % Velocity at t0
         5*tf^4, 4*tf^3, 3*tf^2, 2*tf, 1, 0;  % Velocity at tf
         20*t0^3, 12*t0^2, 6*t0, 2, 0, 0;     % Acceleration at t0
         20*tf^3, 12*tf^2, 6*tf, 2, 0, 0];    % Acceleration at tf

    % Right-hand side (Boundary conditions)
    B = [p0; pf; v0; vf; a0; af];

    % Solving for the coefficients [a5, a4, a3, a2, a1, a0]
    coefficients = A\B;

    % Generate the time vector from t0 to tf with the given step size
    time = t0:step_size:tf;

    % Evaluate the 5th-order polynomial for each time step
    trajectory = coefficients(1)*time.^5 + coefficients(2)*time.^4 + ...
                 coefficients(3)*time.^3 + coefficients(4)*time.^2 + ...
                 coefficients(5)*time + coefficients(6);

    % Create a time series object for the trajectory
    trajectory_ts = timeseries(trajectory, time);

    % Display the polynomial coefficients
    disp('The coefficients of the 5th-order polynomial are:');
    disp(coefficients');
    
    % Optional: plot the trajectory
    figure;
    plot(time, trajectory, 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Position');
    title('5th-Order Polynomial Trajectory');
    grid on;
end