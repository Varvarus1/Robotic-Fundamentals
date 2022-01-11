function [T] = DHtoHT(DH,startFrame,endFrame)
% Convert a DH table into a homogenous transform
%endFrame %for debug
if endFrame == 'e'
    endFrame = height(DH);
end
T = eye(4);
Vfill = zeros(3,1);
Bfill = [0, 0, 0, 1];
%for i = (startFrame+1) : endFrame
%    DHm = eye(4)
%    DHm = DHm * Translate(0, 0, DH(i, 1));
%    DHm = DHm * [rotz(DH(i, 2)), Vfill; Bfill];
%    DHm = DHm * Translate(DH(i, 3), 0, 0);
%    DHm = DHm * [rotx(DH(i, 4)), Vfill; Bfill];
%    T = DHm * T;
%    %i %for debug
%end
%T

T = eye(4);
for i = (startFrame+1) : endFrame
    d = DH(i,1);
    th = DH(i,2);
    a = DH(i,3);
    al = DH(i,4);
    T = T * [cos(th), -sin(th)*cos(al),  sin(th)*sin(al), a*cos(th);
             sin(th),  cos(th)*cos(al), -cos(th)*sin(al), a*sin(th);
               0    ,          sin(al),          cos(al), d;
             Bfill];
end
T
end