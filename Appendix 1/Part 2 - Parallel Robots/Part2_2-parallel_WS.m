%% defines
%S = 170;
%L = 130;
%r = 130;
S = 190;
L = 160;
r = 80;
R = 290;
a = 3*pi/8;
%a = 0;

%% Precalc
PB1 = [0; 0];
PB2 = [sqrt(3)*R; 0];
PB3 = [cos(pi/6)*R; 0.5*R+R];

phi1 = a + pi/6;
phi2 = a + 5*pi/6;
phi3 = a + 9*pi/6;

cc1 =[r * cos(phi1);
      r * sin(phi1)] + PB1;
cc2 =[r * cos(phi2);
      r * sin(phi2)] + PB2;
cc3 =[r * cos(phi3);
      r * sin(phi3)] + PB3;

%% Calc outer limits
rad = S + L;
c1 = nsidedpoly(1000, 'Center', cc1', 'Radius', rad);
c2 = nsidedpoly(1000, 'Center', cc2', 'Radius', rad);
c3 = nsidedpoly(1000, 'Center', cc3', 'Radius', rad);

ws = intersect(c1,c2);
ws = intersect(ws, c3);

%% Calc inner limits
rad = abs(S - L)
c1 = nsidedpoly(1000, 'Center', cc1', 'Radius', rad);
c2 = nsidedpoly(1000, 'Center', cc2', 'Radius', rad);
c3 = nsidedpoly(1000, 'Center', cc3', 'Radius', rad);

ws = subtract(ws, c1)
ws = subtract(ws, c2)
ws = subtract(ws, c3)

%% plot the robot
figure(1)
hold off
%draw base
line = [PB1 PB2 PB3 PB1];
plot(line(1,:),line(2,:),'ko-');
hold on
%Plot the WS
plot(ws)
xlabel('x') ; ylabel('y');
grid
axis([-20 520 -20 480])
key=sprintf("Sa = %.1f\nL = %.1f\nAlpha = %.3fπ", S, L, a/pi);
% gtext(key)

























