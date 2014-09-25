function er = errorcheck()

er = 0;

er = withinreach();
if er == 1
    error('PreChk','Final destination is not within reach of the arm.');
end

er = anglebounds();
if er == 1
    error('PreChk','Angle(s) of the arm are out of bounds.');
end

er = simulation();
if er == 1
    error('FinalPos','Angle(s) of the arm are out of bounds.');
end