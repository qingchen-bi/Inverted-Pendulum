function[sys,x0,str,ts]=sys(t,x,u,flag)
switch flag
      case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 1
        sys=mdlDerivatives(t,x,u);
    case 3
        sys=mdlOutputs(t,x,u);
    case {2,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag=',num2str(flag)]);
end
function[sys,x0,str,ts]=mdlInitializeSizes

sizes=simsizes;
sizes.NumContStates=4;
sizes.NumDiscStates=0;
sizes.NumOutputs=4;
sizes.NumInputs=1;
sizes.DirFeedthrough=1;
sizes.NumSampleTimes=0;
sys=simsizes(sizes);
x0=zeros(1,4);
str=[];
ts=[];

function sys=mdlDerivatives(t,x,u)
 A = [0 1 0 0;0 0 0 0;0 0 0 1;0 0 29.4 0];
 B = [0;1;0;3];
 K0 = [ -10.3061  -14.0646   71.2354   12.5215];
 K1=[ -5.1020   -5.8844   35.1673    6.2948];% J_w = [-2 -3 -4+3i -4-3i];
 K2=[-1.0204   -1.8027   21.4735    3.7676];% J_w = [-1.5 -2 -3+1i -3-1i];
 K3 = [-0.5306   -1.1361   17.6435    2.4454];%J_w = [-1 -1.2 -2+3i -2-3i];
 K4=[1.0204    0.7823   10.7932    1.5726];
 ut = u(1);
 sys3 = (A - B*K1)*x + B*ut;
 %sys3 = ss(A,B,C,D);
for i=1:4
    sys(i)=sys3(i);
end
function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);

