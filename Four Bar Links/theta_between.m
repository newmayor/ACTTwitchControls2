function [theta_btw,direc] = theta_between(theta2,theta3)

if theta3 < (pi/2)
    direc = 1; % Angle is facing +x axis. 
    theta_btw = theta3 + (pi - theta2);
else % If theta2 > pi/2.
    direc = -1; % Angle is facing -x axis. 
    theta_btw = pi - theta3;
    theta_btw = theta2 + theta_btw;
end