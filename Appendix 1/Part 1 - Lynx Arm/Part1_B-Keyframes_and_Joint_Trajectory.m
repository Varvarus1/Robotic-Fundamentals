l = [1,1,1,0.5,0.5];

% %             x,  y,  z,      psi,  mu
% positions = [ 0.6,-0.6, 0.5, -pi/2, pi/2-pi/4;
%               0.6, 0.0, 0.5, -pi/2, pi/2;     
%               0.6, 0.6, 0.5, -pi/2, pi/2+pi/4;
%               0.0, 1.2, 1.0,     0, 0;
%               2.2, 0.0, 1.0, -pi/4, 0;];
positions = [ 0.0, 2.5, 1.0,  0, 0;
              1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0,-1.3, 1.0, -90*(pi/180), 0;
             -1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0, 2.5, 1.0,  0, 0;];

keyframes = zeros(5,5);
for i = 1:height(positions)
    keyframes(i,:) = LynxMotion_IK(l, positions(i,:))
    joints = LynxMotion_FK(l,keyframes(i,:));
    drawArm(i, joints)
end

n = 10;
frames = keyframes(1,:)
lin = linspace(0,1,n);
for i = 1:height(positions)-1
    for j = 1:n
        lcl_frame = keyframes(i,:) + lin(j).*(keyframes(i+1,:) - keyframes(i,:));
        frames = [frames; lcl_frame];
    end
end


path = zeros(height(frames), 3);
for i = 1:height(frames)
    pause(0.05);
    joints = LynxMotion_FK(l,frames(i,:));
    path(i,:) = joints(height(joints),:);
    drawArm(6, joints);
end

figure(7)
set(7,'position',[680 558 560 420])
hold off
plot3(path(:,1),path(:,2),path(:,3),'-k');
xlabel('x') ; ylabel('y') ; zlabel('z');
grid
axis([-4 4 -4 4 -4 4])
