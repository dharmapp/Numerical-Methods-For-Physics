% Calculating Terminal Speed of Particle Falling in Fluid
% written in MATLAB by Dharma P. Permana
% email me at: dhp.permana@gmail.com

clear all;
clc;

m=0.1; %massa in kg
k=0.01; %N.s/m (drag constant)
g=9.8; %m/s^2 
delta=0.001; %time step
vawal=0.5; % initial velocity in m/s
tawal=0; %initial time
v1=vawal; %initial velocity
v2=4; %final velocity initial guess
selisih = abs(v2-v1); %velocity difference

%main iteration part
iter=0;
while selisih>0.001
	v1=v2;
	v2=v1+(g-(k/m)*v1)*delta;
	selisih=abs(v2-v1);
end;
v2 %value of final terminal speed
partisi=(v2-vawal)/delta; %number of iteration completed


%plotting velocity profile 
vawal=0.5; %m/s
tawal=0;
v1=vawal;
v2=4;
for i=1:round(partisi)
	takhir(i)=tawal(i)+delta;
	v2(i)=v1(i)+(g-(k/m)*v1(i))*delta;
	v1(i+1)=v2(i);
	tawal(i+1)=takhir(i);
end;
T=[takhir];
n=length(T);
V=[v2(1:n)];
plot(T,V)
xlabel('time (s)')
ylabel('speed (m/s)')
