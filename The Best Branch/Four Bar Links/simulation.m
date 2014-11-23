function er = simulation()

global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

x_curr = x_i; y_curr = y_i; 
for i = 1:(steps - 1)
    [x_curr,y_curr] = next_xy(x_curr,y_curr);
    [er_1,er_2] = anglebounds(x_curr,y_curr);
end
[er_1,er_2] = anglebounds(x_f,y_f);

if isequal(er_1,0) || isequal(er_2,0)
    er = 0;
else
    er = 1;
end