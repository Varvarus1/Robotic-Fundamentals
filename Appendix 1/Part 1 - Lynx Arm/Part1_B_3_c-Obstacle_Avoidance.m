l = [1,1,1,0.5,0.5];

%             x,  y,  z,      psi,  mu
% positions = [ 0.6,-0.6, 0.5, -pi/2, pi/2-pi/4;
%               0.6, 0, 0.5, -pi/2, pi/2;     
%               0.6, 0.6, 0.5, -pi/2, pi/2+pi/4;
%               0.0, 1.2, 1,     0, 0;
%               1.2,-1.2, 1, -pi/4, 0;];
keyframes = [ 0.0, 2.5, 1.0,  0, 0;
              0.6, 0.22, 0.4 -90*(pi/180) 0;
              0.6, 0.22, 1.1 -90*(pi/180) 0;
            0.716,-0.22, 1.1 -90*(pi/180) 0;
              1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0,-1.3, 1.0, -90*(pi/180), 0;
             -1.0,-1.3, 0.0, -90*(pi/180), 0;
              0.0, 2.5, 1.0,  0, 0;];

% obstacle (cuboid)
origin = [0 -0.1 0];
extents = [2 0.2 1];
X = [0 0 0 0 0 1; 1 0 1 1 1 1; 1 0 1 1 1 1; 0 0 0 0 0 1];
Y = [0 0 0 0 1 0; 0 1 0 0 1 1; 0 1 1 1 1 1; 0 0 1 1 1 0];
Z = [0 0 1 0 0 0; 0 0 1 0 0 0; 1 1 1 0 1 1; 1 1 1 0 1 1];
X = extents(1)*(X) + origin(1);
Y = extents(2)*(Y) + origin(2);
Z = extents(3)*(Z) + origin(3); 


n = 11;
frames = keyframes(1,:);
lin = linspace(0,1,n);
for i = 1:height(keyframes)-1
%     for j = 1:width(keyframes)
%         lcl_frame(:,j) = linspace(keyframes(i,j), keyframes(i+1,j), n)';
%     end
    for j = 1:n
        lcl_frame = keyframes(i,:) + lin(j).*(keyframes(i+1,:) - keyframes(i,:));
        frames = [frames; lcl_frame]
    end
end

figure(6)
hold off
path = zeros(height(frames), 3);
for i = 1:height(frames)
    pause(0.02)
    q = LynxMotion_IK(l,frames(i,:));
    joint_pos = LynxMotion_FK(l,q);
    path(i,:) = joint_pos(height(joint_pos),:);
%% Draw arm (Draw arm function, inline for the cube to be rendered
    sz = size(joint_pos,1);
    set(6,'position',[680 558 560 420])
    hold off
    plot3(joint_pos(:,1),joint_pos(:,2),joint_pos(:,3),'-kx');
    hold on
    fill3(X,Y,Z,'blue');    % draw cube !!
    for i = 1:(sz-1)
        text(joint_pos(i,1),joint_pos(i,2),joint_pos(i,3),num2str(i-1));
    end
    text(joint_pos(sz,1),joint_pos(sz,2),joint_pos(sz,3),'e');
    xlabel('x') ; ylabel('y') ; zlabel('z');
    grid

    axis([-4 4 -4 4 -4 4])
%%%
end

figure(7)
set(7,'position',[680 558 560 420])
hold off
plot3(path(:,1),path(:,2),path(:,3),'-k');
hold on
fill3(X,Y,Z,'blue');
xlabel('x') ; ylabel('y') ; zlabel('z');
grid
axis([-4 4 -4 4 -4 4])
