function stopArm
    global MOTOR1 MOTOR2 

    DriveMotor(MOTOR1,0);
    DriveMotor(MOTOR2,0);
