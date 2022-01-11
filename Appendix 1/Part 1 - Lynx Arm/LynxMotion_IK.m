function [q] = LynxMotion_IK(l, target)
%Forward kinematics for the lynx motion arm

%[x, y, z, psi, mu] = target % "Insufficient number of outputs from right hand side of equal sign to satisfy assignment"
x = target(1);
y = target(2);
z = target(3);
psi = target(4);
mu = target(5);

q = zeros(5,1);
q(5) = mu;
q(1) = atan2(y,x);

xy = sqrt(x*x + y*y);
l4xy = (l(4)+l(5))*cos(psi);
l4z = (l(4)+l(5))*sin(psi);
local_x = xy-l4xy;
local_z = z-l(1)-l4z;

d_sqr = local_x^2 + local_z^2;
l(2)^2 + l(3)^2;
c3 = (d_sqr - l(2)^2 - l(3)^2) / 2*l(2)*l(3);
%debug = -(d*d - l(2)*l(2) - l(3)*l(3)) / (l(2)*l(3))
%q(3) = acos(-(d*d - l(2)*l(2) - l(3)*l(3)) / (l(2)*l(3)))
q(3) = atan2(-sqrt(1-c3*c3), c3);
%q_alt(3) = atan2(-sqrt(1-c3*c3), c3)
%q_alt(3) = -q(3)

%beta = atan2(l(2) + l(3)*cos(q(3)), l(3)*sin(q(3)));
%alpha = atan2(local_z - l(4)*sin(psi), local_x - l(4)*cos(psi));
if(d_sqr == 0)
    beta = 0;
else
    sb = l(3)*sin(q(3)) / sqrt(d_sqr);
    beta = atan2(sb, sqrt(1-sb*sb));
end
alpha = atan2(local_z, local_x);
q(2) = alpha - beta;

q(4) = psi - q(2) - q(3);
end