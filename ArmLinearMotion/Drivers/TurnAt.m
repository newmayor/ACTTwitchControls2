function TurnAt(Motor,velocity)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit

    % Calculate duty to drive the motor
    % Formula to derive duty given a velocity derived by performing a
    % second degree polynomial fit to sample of data, duty vs speed
    velSign = sign(velocity)
    speed=abs(velocity);
    speed = (speed*speed*0.0003+speed*0.0437+0.0248)
    duty = sign(velocity)*(speed*speed*1.0991+speed*5.7637+0.0562)
    DriveMotor(Motor, duty)

    