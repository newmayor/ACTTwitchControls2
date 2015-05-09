% Parameters: Starting angles for the upper arm and forearm.
% Results:
% Description:The function calls the position function to get the polar coordinates
% of the tip of the arm. The speeds function is called to get the derivatives 
% of the angles theta1 and theta 2 with respect to the angle of the entire arm. 
% Th smallest ratio is determined for the angular speed. The final position is
% determined in polar form for the arm.


function s = angularspeed(theta1_i,theta2_i)

[r_i,theta_i] = position(theta1_i,theta2_i);
[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2); 
    
% s1_max, s2_max are given (measured in rad/s)
ratio1 = s1_max / s1; % d(theta)/dt using theta1
ratio2 = s2_max / s2; % d(theta)/dt using theta2

% use the smaller ratio
if ratio1 < ratio2
    max = ratio1;
else
    max = ratio2;
end

s1 = s1 * max; % d(theta1)/dt
s2 = s2 * max; % d(theta2)/dt
    
% send to motors to move at d(theta1)/dt and d(theta2)/dt
% determine time delay

% read theta1, theta2 from pot (measured in degrees)
% update r, theta
[r_f,theta_f] = position(theta1,theta2);

% dtheta = theta_f - theta_i;
% s = dtheta/time;