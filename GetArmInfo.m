function [r,theta,theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo()  
% This function returns the angles (in radians) and cartesian coordinates of the arm

global r_f theta_f x_f y_f
global a PIN_pot1 PIN_pot2
global  L1 L2 

theta1_min = 260;
theta1_max = 990;
theta2_min = 180;
theta2_max = 890;

% Output angles in radians
theta1 = ((a.analogRead(PIN_pot1) - theta1_min) / (theta1_max - theta1_min) * 180) * pi / 180; % from -x axis
theta2 = pi - ((a.analogRead(PIN_pot2) - theta2_min) / (theta2_max - theta2_min) * 180) * pi / 180; % from +x axis

if theta1 < (pi/2)
    x_in = -1 * L1 * cos(theta1);
    y_in = L1 * sin(theta1);
    % disp(x_in); disp(y_in);
else
    x_in = L1 * cos(pi - theta1);
    y_in = L1 * sin(pi - theta1);
    % disp(x_in); disp(y_in);
end

if theta2 < (pi/2)
    angle = 1;
    theta3 = theta1;
    theta2 = theta2 + theta3;
else
    angle = -1;
    theta2 = pi - theta2;
    theta3 = pi - theta1;
    theta2 = theta2 + theta3;
end

[r,theta] = position(theta1,theta2,angle); % theta is from +x axis
disp(r); disp(theta);

if theta < (pi/2)
    x_tip = r * cos(theta);
    y_tip = r * sin(theta);
    % disp(x_tip); disp(y_tip);
else
    x_tip = -1 * r * cos(pi - theta);
    y_tip = r * sin(pi - theta);
    % disp(x_tip); disp(y_tip);
end

fprintf('\nr_i: %d, theta_i: %d, r_f: %d, theta_f: %d\n',r,theta,r_f,theta_f); 
fprintf('x_i: %d, y_i: %d, x_f: %d, y_f: %d\n',x_tip,y_tip,x_f,y_f); 

lx = [0,x_in,x_tip];
ly = [0,y_in,y_tip];
    
plot(x_in,y_in,'O',x_tip,y_tip,'O',0,0,'O',lx,ly);
axis([-30 30 -30 30]);
axis('square');
set(gcf,'color','w');
grid on;