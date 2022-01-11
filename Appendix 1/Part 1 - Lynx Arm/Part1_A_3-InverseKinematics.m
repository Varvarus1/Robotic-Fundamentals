l = [1, 1, 1, 0.5, 0.5]';

%% run FK to get frames from KNOWN joint angles, this is so the IK results
% can be compared to a known truth

%q1 = [0, -33.0471, 156.0943, -78.0471, 0]' * pi/180;
q1 = [0, 279.1415, -156.0943, -78.0471, 0]' * pi/180;
fkjoints = LynxMotion_FK(l,q1)
drawArm(1, fkjoints)
q2 = LynxMotion_IK(l, ...
    [fkjoints(height(fkjoints),:), sum(q1(2:4)), q1(5)]);

%compare the KNOWN angles to the angles returned by the IK
q2 * 180/pi
error = (q2 - q1) * 180/pi
drawArm(2,positions);



% Run IK
q = LynxMotion_IK(l, ...
     [ 0,-1.3, 1, -90*(pi/180) 0]);

positions = LynxMotion_FK(l,q);
drawArm(1,positions);