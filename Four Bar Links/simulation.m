function er = simulation()

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

div = 0.5;
[ep,steps] = epsilon(div);

er_orient = zeros(steps - 1, 2);
x_curr = x_i; y_curr = y_i; 
for i = 1:(steps - 1)
    [x_curr,y_curr] = next_xy(x_curr,y_curr,ep);
    [er_orient(i,1),er_orient(i,2)] = anglebounds(x_curr,y_curr);
end

if isequal(er_orient(:,1),0) || isequal(er_orient(:,2),0)
    er = 0;
else
    er = 1;
end