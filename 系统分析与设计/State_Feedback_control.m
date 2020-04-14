 A = [0 1 0 0;0 0 0 0;0 0 0 1;0 0 29.4 0];
 B = [0;1;0;3];
 C = [1 0 0 0;0 0 1 0];
 D =0;
 
 J_w = [-1.5 -2 -3+1i -3-1i];
 J_BW = [2 -3 -4+3i -4-3i];
 J_YW = [-8 -9 -10+3i -10-3i];
 Kw = place(A,B,J_w)
 Kbw = place(A,B,J_BW);
 Kyw = place(A,B,J_YW);
 sys8 = ss(A-B*Kw,B,C,D)
 
 K1 = [ -10.3061  -14.0646   71.2354   12.5215];
 K2=[ -5.1020   -5.8844   35.1673    6.2948];%  [-2 -3 -4+3i -4-3i];
 K3=[-1.0204   -1.8027   21.4735    3.7676];% [-1.5 -2 -3+1i -3-1i];
 K4 = [-0.5306   -1.1361   17.6435    2.4454];% [-1 -1.2 -2+3i -2-3i];
 K5=[1.0204    0.7823   10.7932    1.5726];
 K6 = [-850.2551 -274.5663  615.6350  108.5221];
 %sys3 = ss(A-B*K2,B,C,D);
  
  
 G3  = zpk(sys3)
 pzmap(G3);
 %nyquist(sys3);
t = 0:0.1:30;
x0 = [0;0;0;0];
u = 1*ones(1,301);
[y,t,x] = lsim(sys3,u,t,x0);%state response
figure,
subplot(2,1,1), plot(t,x(:,1),'LineWidth',2);title('state response')
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
subplot(2,1,2), plot(t,x(:,3),'LineWidth',2);title('state response')
xlabel('t/s'),ylabel('x_{3}�������ڽǶ�'),grid on


 sys3 = ss(A-B*K3,B,C,D);
 sys4 = ss(A-B*K4,B,C,D);
 sys5 = ss(A-B*K1,B,C,D);
 sys6 = ss(A-B*K5,B,C,D);
 sys7 = ss(A-B*K6,B,C,D);

t = 0:0.1:10;
x0 = [0;0;0;0];
u = 1*ones(1,101);
[y3,t,x3] = lsim(sys3,u,t,x0);
[y4,t,x4] = lsim(sys4,u,t,x0)
[y5,t,x5] = lsim(sys5,u,t,x0);
[y6,t,x6] = lsim(sys6,u,t,x0);
[y7,t,x7] = lsim(sys7,u,t,x0);
figure,
subplot(3,1,1), plot(t,x3(:,1),'r','LineWidth',2);title('��������Ϻ��ʵļ���');
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
subplot(3,1,2), plot(t,x7(:,1),'k','LineWidth',2);title('���������Զ�ļ���');
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
subplot(3,1,3), plot(t,x6(:,1),'LineWidth',2);title('���ȶ��ļ���');
xlabel('t/s'),ylabel('x_{1}:С��λ��'),grid on
figure,
subplot(3,1,1), plot(t,x3(:,3),'r','LineWidth',2);title('��������Ϻ��ʵļ���');
xlabel('t/s'),ylabel('x_{3}:�����ڽǶ�'),grid on
subplot(3,1,2), plot(t,x7(:,3),'k','LineWidth',2);title('���������Զ�ļ���');
xlabel('t/s'),ylabel('x_{3}:�����ڽǶ�'),grid on
subplot(3,1,3), plot(t,x6(:,3),'LineWidth',2);title('���ȶ��ļ���');
xlabel('t/s'),ylabel('x_{3}:�����ڽǶ�'),grid on

%subplot(2,1,2), plot(t,x3(:,3),'LineWidth',2);
%xlabel('t/s'),ylabel('x_{3}�������ڽǶ�'),grid on
