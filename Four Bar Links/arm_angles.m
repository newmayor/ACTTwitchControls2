function [theta2,theta3] = arm_angles()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

theta2 = pot_degree(1);
theta3 = pot_degree(2);

theta2 = 90;

x2 = L2 * cosd(theta2);
y2 = L2 * sind(theta2);

x3 = x2 + L3 * cosd(theta3);
y3 = y2 + L3 * sind(theta3);

lx = [0,x2,x3];
ly = [0,y2,y3];

plot(x2,y2,'O',x3,y3,'O',0,0,'O',lx,ly);
axis([-24 24 0 48]);
axis('square');
set(gcf,'color','w');
grid on;