% Parameters:an n by 2 matrix of ones and zeros that represent whether an
% angle is in or out of bounds. The first column represents the first path
% angle options and the second column holds the angle options for the second
% possible orientation.
% Results: a matrix with the value 1 if the theta set orientation is vaiable
% and 0 if it isn't. Where the first column represents the first theta set &
% the second column represets the second theta set.
% Description:function checks to see which orientations are viable if any.

function [ori1,ori2] = check_ori(er_ori)

if er_ori(:,1) == 1;
    ori1 = 1;
elseif er_ori(:,1) == 0
     ori1 = 0;   
elseif er_ori(:,1)~= 1 || er_ori(:,1)~= 0
        error('check_ori:er_ori','Orientation error array has incorrect value(s).')
end
 
if er_ori(:,2) == 1;
    ori2 = 1; 
elseif er_ori(:,2) == 0
     ori1 = 0; 
elseif er_ori(:,2)~= 1 || er_ori(:,2)~= 0
        error('check_ori:er_ori','Orientation error array has incorrect value(s).')
end