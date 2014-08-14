%% DriverTestMain
%  Main Function to test the driver functions



% Clean up the workspace
clear all;
clc
close all;

global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
Pot1_RLimit Pot1_LLimit


%% Initialize Arm
%
initTwitch();


TestSpeeds(.6)