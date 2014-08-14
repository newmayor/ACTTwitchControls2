function DriveMotor(motor,duty)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit
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
else
    a.digitalWrite(PIN_motor1_en, 1);
    a.digitalWrite(PIN_motor2_en, 1);
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