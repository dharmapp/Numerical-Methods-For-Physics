%Simple Euler Code for Damped Harmonic Oscillator in MATLAB
%Using Taylor series Expansion up to Second Order Derrivative 
%Written by Dharma P. Permana
%Email me at: dhp.permana@gmail.com

%initializing
B=2; %damping constant
k=100; %wave number or harmonic function constant (related to spring constant)
delta=0.001; %step size
xawal=0; %initial time
xakhir=10; %final time (motion period)
partisi=(xakhir-xawal)/delta; %number of partition
yawal=1; %initial position
uawal=0; %initial velocity

%main iteration code
for i=1:round(partisi)
	xakhir(i)=xawal(i)+delta;
	yakhir(i)=yawal(i)+uawal(i)*delta+0.5*(-B*uawal(i)-k*yawal(i))*delta^2 + (1/6)*(k*uawal(i)+(B^2)*uawal(i)+B*k*yawal(i))*delta^3;
	uakhir(i)=uawal(i)+delta*(-B*uawal(i)-k*yawal(i))+0.5*(k*uawal(i)+(B^2)*uawal(i)+B*k*yawal(i))*delta^2;
	yawal(i+1)=yakhir(i);
	uawal(i+1)=uakhir(i);
	xawal(i+1)=xakhir(i);
end;
X=[xakhir];
n=length(X);
Y=[yakhir(1:n)];
U=[uakhir(1:n)];
plot(X,Y,X,U), legend('position','velocity')
xlabel('t')
