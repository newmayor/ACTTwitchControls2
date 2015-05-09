% Parameters: motor that wants to be driven & duty cycle for the desired motor
% Results: Motor is driven.
% Description: Function declares global variables for the motor pin outs, pot 
% pin outs, maximum angle speeds, and motor options. Checks the duty cycle 
% entered by the user and initially disables the motor and changes the duty to 
% zero if the duty input is greater than 1. If the duty cycle is less than zero 
% the function proceeds to check which motor is supposed to be moved. Appropriate 
% signals are sent to the arduino to get the desired motor to move.

function DriveMotor(motor,duty)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot0 PIN_pot1
    global s1max s2max

   
% Check input
if(abs(duty)>1)
    % Init motors disabled
    a.digitalWrite(PIN_motor1_en, 0);
    a.digitalWrite(PIN_motor2_en, 0);

    % Init motors at zero duty
    a.analogWrite(PIN_motor1_pwm1, 0);
    a.analogWrite(PIN_motor1_pwm2, 0);
    a.analogWrite(PIN_motor2_pwm1, 0);
    a.analogWrite(PIN_motor2_pwm2, 0);
    error('Second argument of Drive motor must be between -1 and 1\n')
end

if(motor == MOTOR1)
    if(duty<0)
        a.analogWrite(PIN_motor1_pwm1, 0);
        a.analogWrite(PIN_motor1_pwm2, round(abs(duty)*MOTORMAX));
    else
        a.analogWrite(PIN_motor1_pwm1, round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor1_pwm2, 0);
    end
elseif(motor == MOTOR2)
    if(duty<0)
        a.analogWrite(PIN_motor2_pwm1, 0);
        a.analogWrite(PIN_motor2_pwm2, round(abs(duty)*MOTORMAX));
    else
        a.analogWrite(PIN_motor2_pwm1, round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor2_pwm2, 0);
    end
end