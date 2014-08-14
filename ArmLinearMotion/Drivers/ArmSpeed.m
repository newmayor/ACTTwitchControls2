function speed = ArmSpeed(Motor)    

    global a

    curPosition =  a.analogRead(Motor);
    pause(0.1);
    finPosition = a.analogRead(Motor);
    
    speed=(finPosition-curPosition)/.25;
    