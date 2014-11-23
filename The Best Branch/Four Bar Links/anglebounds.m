function [er_1,er_2] = anglebounds(x_curr,y_curr)

[theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x_curr,y_curr);

if (theta2_1 >= theta2_min) && (theta2_1 <= theta2_max)
    er_1 = 0;
else
    er_1 = 1;
end 
if (theta3_1 >= theta3_min) && (theta3_1 <= theta3_max)
    er_1 = 0;
else
    er_1 = 1;
end 

if (theta2_2 >= theta2_min) && (theta2_2 <= theta2_max)
    er_2 = 0;
else
    er_2 = 1;
end 
if (theta3_2 >= theta3_min) && (theta3_2 <= theta3_max)
    er_2 = 0;
else
    er_2 = 1;
end 