function control(r_i,r_f,theta_i,theta_f)

% lengths of the inner and outer arms
L1 = 9; L2 = 14.75;

[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2);

% s1_max, s2_max are given (measured in rad/s)
ratio1 = s1_max / s1; % d(theta)/dt using theta1
ratio2 = s2_max / s2; % d(theta)/dt using theta2

% use the smaller ratio
if rario1 < ratio2
max = ratio1;
else
max = ratio2;
end

s1 = s1 * max; % d(theta1)/dt
s2 = s2 * max; % d(theta2)/dt

% send to motors to move at d(theta1)/dt and d(theta2)/dt
% determine time delay

while theta_i ~= theta_f
    % read theta1, theta2 from pot (measured in degrees)
    % compute r, theta
    [r,theta] = position(theta1,theta2);
    
    % update r_i, theta_i and compute new set of speeds s1, s2
    r_i = r; theta_i = theta;
    [s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2); 
    
    % s1_max, s2_max are given (measured in rad/s)
    ratio1 = s1_max / s1; % d(theta)/dt using theta1
    ratio2 = s2_max / s2; % d(theta)/dt using theta2
    
    % use the smaller ratio
    if rario1 < ratio2
        max = ratio1;
    else
        max = ratio2;
    end
    
    s1 = s1 * max; % d(theta1)/dt
    s2 = s2 * max; % d(theta2)/dt
    
    % tic()
    % send to motors to move at d(theta1)/dt and d(theta2)/dt
    % determine time delay
    % time = toc();
    
    % read theta1, theta2 from pot (measured in degrees)
    % update r, theta
    [r,theta] = position(theta1,theta2);
end 