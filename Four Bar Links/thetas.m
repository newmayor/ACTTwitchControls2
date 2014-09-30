% This function returns current angles of the arm in radians. 

function [theta2,theta3] = thetas()

global L2 L3 theta1 theta4
global x_f y_f
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

% Output angles in radians
theta2 = pi - ((a.analogRead(PIN_pot1) - theta1_min) / (theta1_max - theta1_min) * 180) * pi / 180; % from +x axis
theta3 = pi - ((a.analogRead(PIN_pot2) - theta2_min) / (theta2_max - theta2_min) * 180) * pi / 180; % from +x axis


% 
% function [ theta2_1, theta2_2, theta3_1, theta3_2 ] = Thetas( x, y )
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% 
% r2 = 12;
% r3 = 18;
% a = (x^2+y^2+r3^2-r2^2)/(2*r3*sqrt(x^2+y^2));
% 
% %% first solution. the domain error may result in NAN for acos()
%     if((a > 1.0) && (a-1.0 < eps(1)))
%       theta3_1 = atan(y/x);
%     elseif((a < -1.0) && (-a-1.0 < eps(1)))
%       theta3_1 = atan(y/x) + pi;
%     else 
%       theta3_1 = atan(y/x) + acos(a);
%     end
%     s1 = (y - r3 * sin(theta3_1))/r2;
%     c1 = (x - r3 * cos(theta3_1))/r2;
%     theta2_1 =  atan(s1/c1);
%     
% %% make sure all angles are within (-M_PI, M_PI)
%     if(theta2_1 > pi)
%       theta2_1 = theta2_1 - 2*pi;
%     elseif(theta2_1 < -pi)
%       theta2_1 = theta2_1 + 2*pi;
%     end
%     
%     if(theta3_1 > pi)
%       theta3_1 = theta3_1 - 2*pi;
%     elseif(theta3_1 < -pi)
%       theta3_1 = theta3_1 + 2*pi;
%     end
%     
% %% second solution
%     if((a > 1.0) && (a-1.0 < eps(1)))
%       theta3_2 = atan(y/x);
%     elseif((a < -1.0) && (-a-1.0 < eps(1)))
%       theta3_2 = atan(y/x) - pi;
%     else 
%       theta3_2 = atan(y/x) - acos(a);
%     end
%     s1 = (y - r3 * sin(theta3_2))/r2;
%     c1 = (x - r3 * cos(theta3_2))/r2;
%     theta2_2 =  atan(s1/c1);
%     
% %% make sure all angles are within (-M_PI, M_PI)
%     if(theta2_2 > pi)
%       theta2_2 = theta2_2 - 2*pi;
%     elseif(theta2_2 < -pi)
%       theta2_2 = theta2_2 + 2*pi;
%     end
%     
%     if(theta3_2 > pi)
%       theta3_2 = theta3_2 - 2*pi;
%     elseif(theta3_2 < -pi)
%       theta3_2 = theta3_2 + 2*pi;
%     end
% 
% 
% end
