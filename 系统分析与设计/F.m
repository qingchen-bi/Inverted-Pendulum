clear;
A1 = [0 1 0 0;0 0 0.731 0;0 0 0 1;0 0 29.4 0];
B1 = [0;0.9124;0;2.7372];
C1 = [1 0 0 0;0 0 1 0];
D1 = 0;
sys1 = ss(A1,B1,C1,D1);%Continuous-time state-space model.
sys1_c = ctrb(sys1);
c1 = rank(sys1_c);
if c1==4
    disp("The rank is 4, Controllable");
else
    disp("Uncontrollable");
end
sys1_o = obsv(sys1);
o1 = rank(sys1_o);
if o1==4
    disp("The rank is 4, Observable");
else
    disp("Observable");
end
G = zpk(sys1);
pz = pole(G);
pzmap(G);
%bode(sys1)
%nyquist(sys1);

t = 0:0.1:10;
x0 = [0;0;0;0];
u = 1*ones(1,101);
[y,t,x] = lsim(sys1,u,t,x0);
figure,
subplot(2,1,1), plot(t,x(:,1),'LineWidth',2);title('state response');
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
subplot(2,1,2), plot(t,x(:,3),'LineWidth',2);title('state response');
xlabel('t/s'),ylabel('x_{3}�������ڽǶ�'),grid on
