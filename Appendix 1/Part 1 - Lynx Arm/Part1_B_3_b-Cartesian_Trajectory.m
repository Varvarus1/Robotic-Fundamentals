l = [1,1,1,0.5,0.5];

%             x,  y,  z,      psi,  mu
% positions = [ 0.6,-0.6, 0.5, -pi/2, pi/2-pi/4;
%               0.6, 0, 0.5, -pi/2, pi/2;     
%               0.6, 0.6, 0.5, -pi/2, pi/2+pi/4;
%               0.0, 1.2, 1,     0, 0;
%               1.2,-1.2, 1, -pi/4, 0;];
keyframes = [ 0.0, 2.5, 1.0,  0, 0;
              1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0,-1.3, 1.0, -90*(pi/180), 0;
             -1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0, 2.5, 1.0,  0, 0;];

n = 10;
frames = keyframes(1,:);
lin = linspace(0,1,n);
for i = 1:height(keyframes)-1
%     for j = 1:width(keyframes)
%         lcl_frame(:,j) = linspace(keyframes(i,j), keyframes(i+1,j), n)';
%     end
    for j = 1:n
        lcl_frame = keyframes(i,:) + lin(j).*(keyframes(i+1,:) - keyframes(i,:));
        frames = [frames; lcl_frame];
    end
end

figure(6)
hold off
path = zeros(height(frames), 3);
for i = 1:height(frames)
    pause(0.1)
    q = LynxMotion_IK(l,frames(i,:));
    joint_pos = LynxMotion_FK(l,q)
    path(i,:) = joint_pos(height(joint_pos),:);
    drawArm(6, joint_pos);
end

figure(7)
set(7,'position',[680 558 560 420])
hold off
plot3(path(:,1),path(:,2),path(:,3),'-k');
xlabel('x') ; ylabel('y') ; zlabel('z');
grid
axis([-4 4 -4 4 -4 4])
