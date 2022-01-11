L = [1,1,1,0.5,0.5]';
i_ = 13;
j_ = 10;
k_ = 10;
m_ = 16;
q1 = linspace(0, 2*pi, i_);
q2 = linspace(0, 2*pi, j_);
q3 = linspace(0, 2*pi, k_);
q4 = linspace(0, 2*pi, m_ );

clf(1);
clf(2);
clf(3);

figure (1);
set(1,'position',[680 558 560 420])
hold on
EEcirc = zeros(10,3);
for i = 1:i_
    i
    for j = 1:j_
        for k = 1:k_
            for m = 1:m_
                lq = [q1(i) q2(j) q3(k) q4(m), 0]';
                points = LynxMotion_FK(L,lq);
                EEcirc(m,:) = points(5,:);
            end
            plot3(EEcirc(:,1),EEcirc(:,2),EEcirc(:,3),'r-')
        end
    end
end
xlabel('x') ; ylabel('y') ; zlabel('z');
grid

hold off
figure (2);
set(2,'position',[680 558 560 420])
hold on
for i = 1:i_
    i
    for j = 1:j_
        for k = 1:k_
            for m = 1:m_
                lq = [q1(i) q2(j) q3(k) q4(m), 0]';
                points = LynxMotion_FK(L,lq);
                EEcirc(m,:) = points(5,:);
            end
            plot(EEcirc(:,1),EEcirc(:,3),'r-')
        end
    end
end
xlabel('x') ; ylabel('z');
grid

hold off
figure (3);
set(3,'position',[680 558 560 420])
hold on
i_2 = 100;
q1 = linspace(0, 2*pi, i_2);
for i = 1:i_2
    i
    for j = 1:j_
        for k = 1:k_
            for m = 1:m_
                lq = [q1(i) q2(j) q3(k) q4(m), 0]';
                points = LynxMotion_FK(L,lq);
                EEcirc(m,:) = points(5,:);
            end
            plot(EEcirc(:,1),EEcirc(:,2),'r-')
        end
    end
end
xlabel('x') ; ylabel('y');
grid
