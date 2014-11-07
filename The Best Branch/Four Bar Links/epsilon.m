function epsilon()

global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

dx = x_f - x_i; dy = y_f - y_i; 
distance = sqrt(dx^2 + dy^2); 
div = 0.5; 
steps = distance/div; 
ep = dx - dx * (distance - div) / distance;