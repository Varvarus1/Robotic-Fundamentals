function [] = drawArm(figName,points)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
sz = size(points,1);

figure (figName)
set(figName,'position',[680 558 560 420])
hold off
plot3(points(:,1),points(:,2),points(:,3),'-kx');
for i = 1:(sz-1)
    text(points(i,1),points(i,2),points(i,3),num2str(i-1));
end
text(points(sz,1),points(sz,2),points(sz,3),'e');
xlabel('x') ; ylabel('y') ; zlabel('z');
grid

axis([-4 4 -4 4 -4 4])
end