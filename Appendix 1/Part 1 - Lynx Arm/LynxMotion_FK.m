function [points] = LynxMotion_FK(l,q)
% Returns the position of the end effector and revolute joint positions

% psi mu
points = zeros(5,3);
ee = zeros(1,3)';

% storing each joint's position for visualization's sake
% link 1
ee(3) = l(1);
points(2,1:3) = ee;

% Link 2
ee(3) = ee(3) + sin(q(2)) * l(2);
inter = cos(q(2)) * l(2);
ee(1) = ee(1) + cos(q(1)) * inter;
ee(2) = ee(2) + sin(q(1)) * inter;
points(3,1:3) = ee;

% Link 3
ee(3) = ee(3) + sin(q(3) + q(2)) * l(3);
inter = cos(q(2) + q(3)) * l(3);
ee(1) = ee(1) + cos(q(1)) * inter;
ee(2) = ee(2) + sin(q(1)) * inter;
points(4,1:3) = ee;

% Link 4 + 5
ee(3) = ee(3) + sin(q(4) + q(3) + q(2)) * (l(4) + l(5));
inter = cos(q(2) + q(3) + q(4)) * (l(4) + l(5));
ee(1) = ee(1) + cos(q(1)) * inter;
ee(2) = ee(2) + sin(q(1)) * inter;
points(5,1:3) = ee;

end