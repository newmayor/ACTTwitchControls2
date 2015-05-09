function DriveMotor(motor,duty)
global a MOTOR0 MOTOR1 MOTORMAX PIN_motor0_en PIN_motor0_pwm1 PIN_motor0_pwm2 PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_pot0 PIN_pot1
    
% Check input
if(abs(duty)>1)
    % Init motors disabled
    a.digitalWrite(PIN_motor0_en, 0);
    a.digitalWrite(PIN_motor1_en, 0);

    % Init motors at zero duty
    a.analogWrite(PIN_motor0_pwm1, 0);
    a.analogWrite(PIN_motor0_pwm2, 0);
    a.analogWrite(PIN_motor1_pwm1, 0);
    a.analogWrite(PIN_motor1_pwm2, 0);
    error('Second argument of Drive motor must be between -1 and 1\n')
end

if(motor == MOTOR0)
    disp('motor = 0');
    if(duty<0)
        disp('duty < 0');
        a.analogWrite(PIN_motor0_pwm1, 0);
        a.analogWrite(PIN_motor0_pwm2, round(abs(duty)*MOTORMAX));
    else
        disp('duty > 0');
        disp(round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor0_pwm1, round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor0_pwm2, 0);
    end
elseif(motor == MOTOR1)
    disp('motor = 1');
    if(duty<0)
        disp('duty < 0');
        disp(round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor1_pwm1, 0);
        a.analogWrite(PIN_motor1_pwm2, round(abs(duty)*MOTORMAX));
    else
        disp('duty > 0');
        disp(round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor1_pwm1, round(abs(duty)*MOTORMAX));
        a.analogWrite(PIN_motor1_pwm2, 0);
    end
end