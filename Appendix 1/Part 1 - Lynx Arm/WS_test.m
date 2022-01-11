L_1 = 0.2;
L_2 = 1;
L_3 = 1;


figure(1)
hold on
plot(0,0,'kx');
hold off

n = 25;
rot = linspace(0,2*pi,n);
points = zeros(n*n*n,2);
for i = 1:n
    for j = 1:n
        for k = 1:n
           points((i-1)*n*n+(j-1)*n+k, :) = [
               L_1*cos(rot(i)) + L_2*cos(rot(i) + rot(j)) + L_3*cos(rot(i) + rot(j) + rot(k));
               L_1*sin(rot(i)) + L_2*sin(rot(i) + rot(j)) + L_3*sin(rot(i) + rot(j) + rot(k))];
        end 
    end
end
plot(points(:,1),points(:,2), 'b-');
grid
key=sprintf("L1 = %.1f\nL2 = %.1f\nL3 = %.1f", L_1, L_2, L_3);
%gtext(key)