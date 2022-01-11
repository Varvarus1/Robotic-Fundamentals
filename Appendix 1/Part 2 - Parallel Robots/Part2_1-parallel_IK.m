%% defines
xc = 210;
yc = 240;
r = 130;
R = 290;
S = 170;
L = 130;

a = -pi/4;

%% Precalc
PB1 = [0; 0];
PB2 = [sqrt(3)*R; 0];
PB3 = [cos(pi/6)*R; 0.5*R+R];

phi1 = a + pi/6;
phi2 = a + 5*pi/6;
phi3 = a + 9*pi/6;

%% trial
PP1 =[xc - r * cos(phi1);
      yc - r * sin(phi1)];

"Leg 1"
h1_sqr = PP1(1)*PP1(1) + PP1(2)*PP1(2);
c1 = atan2(PP1(2), PP1(1));
d1 = acos((S*S - L*L + h1_sqr) / (2*S*sqrt(h1_sqr)));
q1 = c1 + d1

M1 = [S*cos(q1); S*sin(q1)];

"Leg 2"
[q2, M2, PP2] = Parallel_IK(xc, yc, phi2, S, L, r, PB2);
"Leg 3"
[q3, M3, PP3] = Parallel_IK(xc, yc, phi3, S, L, r, PB3);

%% plot the robot
figure(1)
hold off
%draw base
line = [PB1 PB2 PB3 PB1];
plot(line(1,:),line(2,:),'ko-');
hold on
% draw platform
line = [PP1 PP2 PP3 PP1];
plot(line(1,:),line(2,:),'ko-');
% draw legs
line = [PB1 M1 PP1];
plot(line(1,:),line(2,:),'b-');
line = [PB2 M2 PP2];
plot(line(1,:),line(2,:),'r-');
line = [PB3 M3 PP3];
plot(line(1,:),line(2,:),'g-');

xlabel('x') ; ylabel('y');
grid
axis([-20 520 -20 480])
key=sprintf("Xc = %.1f\nYc = %.1f\nAlpha = %.2fπ", xc, yc, a/pi);
% gtext(key)
"done"

%% Leg func
function [theta, M, PP] = Parallel_IK(Xc, Yc, phi, S, L, r, PB)
    PPx = Xc - r * cos(phi);
    PPy = Yc - r * sin(phi);
    PP = [PPx; PPy];

    PPx = PPx - PB(1);
    PPy = PPy - PB(2);
    h_sqr = PPx*PPx + PPy*PPy;

    c = atan2(PPy, PPx)
    (S*S - L*L + h_sqr) / (2*S*sqrt(h_sqr))
    d = acos((S*S - L*L + h_sqr) / (2*S*sqrt(h_sqr)))
    theta = c + d

    M = [S*cos(theta); S*sin(theta)] + PB
end


