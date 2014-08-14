function TestSpeeds(duty)   

global a MOTOR1 MOTOR2  Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
Pot1_RLimit Pot1_LLimit

    fprintf('Duty: %.2f\n',duty)
    for n = 1:5


    elapsedTime = CalibrateSpeeds(MOTOR2,1,duty);
    speed = 1/elapsedTime;

    fprintf('Time Elapsed: %5.4f sec\t Speed: %5.4f rad/sec\n',elapsedTime,speed)
    end