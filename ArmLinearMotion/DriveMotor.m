function DriveMotor(motor,duty)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2
    global dt1max dt2max

    
%check input
if(abs(duty)>1)
    % init motors disabled
    a.digitalWrite(PIN_motor1_en, 0);
    a.digitalWrite(PIN_motor2_en, 0);

    % init motors at zero duty
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