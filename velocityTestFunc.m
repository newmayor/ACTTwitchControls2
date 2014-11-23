% 
% 
% 
%% Set Experiment Loop

%%
% Set arm to default position of known value -- possibly horizontal to
% positive x-axis.

%% Joint 1 - Forward
% Isolate Joint 1 and sweep through entire range of motion while timing the
% motion

tic

duty = 0.5; %initial duty cycle value -- arbitrary [-1:1]
DriveMotor(Motor1, duty);

% Print all initial and final variable values (ie. change of angle,
% voltage, end time)
%% Joint 2 - Forward
% Isolate Joint 2 and sweep through entire range of motion while timing the
% motion


% Print all initial and final variable values (ie. change of angle,
% voltage, end time)

%% Joint 1 - Backward
% Isolate Joint 1 and sweep through entire range of motion backwards while timing the
% motion


% Print all initial and final variable values (ie. change of angle,
% voltage, end time)

%% Joint 2 - Backward
% Isolate Joint 2 and sweep through entire range of motion backwards while timing the
% motion


% Print all initial and final variable values (ie. change of angle,
% voltage, end time)


%% Excel Export
% Save all relevant variables
% Plot duty vs average angular velocities for each motor -- forward and
% backward
% Export to excel -- excelwrite()

