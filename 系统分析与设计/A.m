clear;
A2 = [0 1 0 0;0 0 0 0;0 0 0 1;0 0 29.4 0];
B2 = [0;1;0;3];
C2 = [1 0 0 0;0 0 1 0];
D2 = 0;
sys2 = ss(A2,B2,C2,D2);%Continuous-time state-space model.
sys2_c = ctrb(sys2);
c2 = rank(sys2_c);
if c2==4
    disp("The rank is 4, Controllable");
else
    disp("Uncontrollable");
end
sys2_o = obsv(sys2);
o2 = rank(sys2_o);
if o2==4
    disp("The rank is 4, Observable");
else
    disp("Observable");
end
G2 = zpk(sys2);
pz = pole(G2);
pzmap(G2);
bode(sys2);
%nyquist(sys2);

t = 0:0.1:10;
x0 = [0;0;0;0];
u = 1*ones(1,101);
[y,t,x] = lsim(sys2,u,t,x0);
figure,
subplot(2,1,1), plot(t,x(:,1),'LineWidth',2);title('state response');
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
subplot(2,1,2), plot(t,x(:,3),'LineWidth',2);title('state response');
xlabel('t/s'),ylabel('x_{3}�������ڽǶ�'),grid on
