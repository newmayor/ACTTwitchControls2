function er = errorcheck()

er = 0;

% er = withinreach(); 
% if er == 1
%     error('errocheck:withinreach','Final destination is not within reach of the arm.');
% end

er = simulation();
if er == 1
    error('errorcheck:simulation','Angle(s) of the arm are out of bounds.');
end