clc

L = [1, 1, 1, 0.5, 0.5]';
q = [0, 0, 0, 0, 0]' * pi/180; 

% Given  d    Th     a  alpha
% DH = [L(1), q(1),    0,   pi/2;
%          0, q(2), L(2),   0;
%          0, q(3), L(3),   0;
%          0, q(4), L(5),   0;
%          0,-pi/2,    0,-pi/2;
%       L(5), q(5),    0,   0];

% Given  d    Th     a  alpha
DH = [L(1), q(1),    0,   pi/2;
         0, q(2), L(2),   0;
         0, q(3), L(3),   0;
         0, q(4)-pi/2,    0, -pi/2;
 L(4)+L(5), q(5),    0,   0];

frames = zeros(4,4,height(DH));
for i = 1:height(DH)
    frames(:,:,i) = DHtoHT(DH, 0, i);
end

figure (1)
set(1,'position',[680 558 560 420])

hold off
plot3(0,0,0,'rx')
hold on
%plot frame 0
text(0,0,0,'0');
for i = 1:height(DH)
    %build frame
    lines = zeros(2,3);
    for j = 1:3 %% loop thru axes
        v = eye(4,4);
        v(j,4) = 0.25;
        lines(1,:) = frames(1:3,4,i);
        temp = frames(:,:,i) * v
        lines(2,:) = temp(1:3,4);
        if j == 1
            plot3(lines(:,1),lines(:,2),lines(:,3),'r-')
        elseif j == 2
            plot3(lines(:,1),lines(:,2),lines(:,3),'g-')
        elseif j == 3
            plot3(lines(:,1),lines(:,2),lines(:,3),'b-')
        end
    end

    %plot the frame id
    text(frames(1,4,i),frames(2,4,i),frames(3,4,i),num2str(i));
end
xlabel('x') ; ylabel('y') ; zlabel('z');
grid
axis([0 3.5 -1.75 1.75 0 3.5])