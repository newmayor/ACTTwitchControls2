function [theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo()  
% This function returns the angles (in radians) and cartesian coordinates of the arm

global a PIN_pot1 PIN_pot2
global  L1 L2 

theta1_min = 260;
theta1_max = 990;
theta2_min = 180;
theta2_max = 890;

% Output angles in radians
theta1 = pi - ((a.analogRead(PIN_pot1)-theta1_min)/(theta1_max-theta1_min)*180)*pi/180;
theta2 = ((a.analogRead(PIN_pot2)-theta2_min)/(theta2_max-theta2_min)*180)*pi/180;

if theta2 > (pi/2)
    theta3 = pi - theta2;
    theta2 = theta2 + theta3;
else
    theta3 = pi - theta1;
    theta2 = theta2 + theta3;
end

x_in = L1 * cos(theta1);
y_in = L1 * sin(theta1);

[r,theta] = position(theta1,theta2);
x_tip = r * cos(theta);
y_tip = r * sin(theta);

lx = [0,x_in,x_tip];
ly = [0,y_in,y_tip];
    
plot(x_in,y_in,'O',x_tip,y_tip,'O',0,0,'O',lx,ly);
axis([-30 30 -30 30]);
axis('square');
set(gcf,'color','w');
grid on;
