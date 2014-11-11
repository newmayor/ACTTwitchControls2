function [ output_args ] = orientation( input_args )
% Orientation Function: 
% Function: to determine which angle pairs (arm orientation) is/are valid 
%     from movement 
% Function: to check for the shortest displacement of initial and final 
%     thetas, to determine best arm orientation in the event that both angle 
%     pairs are valid 
% Function: Reset the arm orientation if necessary 
%     compare current arm orientation with previously determined desired 
%         orientation 
%     move the arm in a straight line path to full extension then back to 
%         initial position using the other arm orientation

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

% First Determine Current Orientation, save to curr_ori

[ori1,ori2] = check_ori(er_ori);
if ori1 == ori2
    if ori1 == 1 && ori2 == 1
        determin_ori();
    else % In case ori1 == 0 && ori2 == 0
        error('check_ori:er_ori','Orientation error array has incorrect value(s).');
    end
else
    if ori1 == 1
        target_ori = 1;
    end
    if ori2 == 1
        target_ori = 2; 
    end
end

if target_ori ~= curr_ori
     % Calculate X,Y for arm completely extended 
     % Move arm linearly to that position using current orientation angle progression
     % Returen to initial X,Y linearly using the other orientation angle progression   
end
end