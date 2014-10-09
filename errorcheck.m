% Parameters:None
% Results: Error Message displayed to screen.
% Descritpition: Sets the er value to false.Function checks to see 
% if the point can be reached by the arm by calling the function withinreach().
% Checks to see if the individual angles, the angle created by the upper arm 
% and forearm or the angle created by the x- axis and the upper arm are within
% bounds by calling the function anglebounds().Checks to see if the final 
% destination is within the boundaries of the arm by calling the function 
% simulation(). If any function called reports a true value then the appropriate
% error message is displayed to the user.

function er = errorcheck()

er = 0;

er = withinreach();
if er == 1
    error('PreChk','Final destination is not within reach of the arm.');
end

er = anglebounds();
if er == 1
    error('PreChk','Angle(s) of the arm are out of bounds.');
end

er = simulation();
if er == 1
    error('FinalPos','Angle(s) of the arm are out of bounds.');
end