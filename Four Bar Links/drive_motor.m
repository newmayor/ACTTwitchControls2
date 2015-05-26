function drive_motor(motor,duty)

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

% Check input
if(abs(duty) > 1)
    % Init motors disabled
    a.digitalWrite(pin_motor1_en, 0);
    a.digitalWrite(pin_motor2_en, 0);

    % Init motors at zero duty
    a.analogWrite(pin_motor1_pwm1, 0);
    a.analogWrite(pin_motor1_pwm2, 0);
    a.analogWrite(pin_motor2_pwm1, 0);
    a.analogWrite(pin_motor2_pwm2, 0);
    error('Second argument of Drive motor must be between -1 and 1.\n')
end

if(motor == motor1)
    if(duty < 0)
        a.analogWrite(pin_motor1_pwm1, 0);
        a.analogWrite(pin_motor1_pwm2, round(abs(duty) * motor_max));
    else
        a.analogWrite(pin_motor1_pwm1, round(abs(duty) * motor_max));
        a.analogWrite(pin_motor1_pwm2, 0);
    end
    
elseif(motor == motor2)
    if(duty < 0)
        a.analogWrite(pin_motor2_pwm1, 0);
        a.analogWrite(pin_motor2_pwm2, round(abs(duty) * motor_max));
    else
        a.analogWrite(pin_motor2_pwm1, round(abs(duty) * motor_max));
        a.analogWrite(pin_motor2_pwm2, 0);
    end
end