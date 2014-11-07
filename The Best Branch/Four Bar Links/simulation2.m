function [moveX = simulation2(TargetX, TargetY)

global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2




%%% NOTE: I DID NOT COPY AND PASTE SIMULATION YET BECAUSE I AM CONCERNED
%%%    THAT SIMULATION.M IS NOT SAVING ITS LOOPED CALCULATONS AS A MATRIX
%%%    RATHER IT IS OVERWRITIN A SINGLE SCALAR VARIABLE.      ~ALEX