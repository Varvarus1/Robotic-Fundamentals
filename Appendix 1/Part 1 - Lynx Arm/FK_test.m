l = [1, 1, 1, 0.5, 0.5]';
q = [0, 45, 0, 90, 0]' * pi/180;
joints = LynxMotion_FK(l,q);
drawArm(1, joints)
