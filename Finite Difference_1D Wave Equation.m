% 1D Wave Equation using Finite Difference Method 
% written in MATLAB
% written by: Dharma P. Permana 
% email: dhp.permana@gmail.com
% However this code only valid for even number grids


clear all
clc

%System Size Dimension
Lx=10; %length dimension
T=100; %time dimension

%Constant for Waves
k=20; % wave number
w=3; % angular frequency

%Number of grid
n=50;


%grid width
dx=Lx/n; %spatial grid
dt=T/n; %temporal grid

% x and t coordinates in grid
x=(1:n-1)*dx;
t=(1:n-1)*dt;

%Boundary Value
a=1;
b=1;
c=1;
d=1;

%Matrix for coefficient
for i=1:(n-1)^2
	for j=1:(n-1)^2 
		if i==j
			A(i,j)=-(2*(w^2)/dx^2 - 2*(k^2)/(dt^2));
		elseif j==i+(n-1)
			A(i,j)=-(k^2)/(dt^2);
		elseif j==i-(n-1)
			A(i,j)=-(k^2)/(dt^2);
		elseif mod(i,n-1)==1
			if j==i+1
				A(i,j)=(w^2)/dx^2;
			end;
		elseif mod(i,n-1) ~=1 & mod(i,n-1)~=0
			if j==i+1
				A(i,j)=(w^2)/dx^2;
			elseif j==i-1
				A(i,j)=(w^2)/dx^2;
			end;
		elseif mod(i,n-1)==0
			if j==i-1
				A(i,j)=(w^2)/dx^2;
			end;
		else
			A(i,j)=0;
		end;
	end;
end;


%Matrix for Boundary Condition
for i=1:(n-1)^2
	if mod(i,n-1)==1 % floor(i/(n-1)) %corner bottom left
		B(i,1)=a*(w^2)/dx^2 - b*(k^2)/(dt^2);
	elseif mod(i,n-1) ~=1 & mod(i,n-1)~=0 & floor(i/(n-1))==0 %bottom
		B(i,1)=b*k^2/(dt^2);
	elseif mod(i,n-1)==0 & i/(n-1)==1 %corner bottom right
		B(i,1)=-c*(w^2)/dx^2+b*(k^2)/(dt^2);
	elseif mod(i,n-1)==1 %left
		B(i,1)=-a*(w^2)/dx^2
	elseif mod(i,n-1)==0 %right
		B(i,1)=-c*(w^2)/dx^2;
	elseif mod(i,n-1)==1 & ceil(i/(n-1))==n-1 %corner left top
		B(i,1)=-a*(w^2)/dx^2 + d*(k^2)/(dt^2);
	elseif mod(i,n-1)==0 & ceil(i/(n-1))==n-1 %corner right top
		B(i,1)=-c*(w^2)/dx^2 + d*(k^2)/(dt^2);
	elseif mod(i,n-1)~=1 & mod(i,n-1)~=0 & floor(1/n-1)==1 %top
		B(i,1)=d*(k^2)/(dt^2);
	else 
		B(i,1)=0;
	end;
end; 

phi=A\B; %Matrix of wave function
X=1:(n-1);
p=1;

%Animating Wave Function
for i=1:(n-1)
	q=1;
	for j=1:(n-1)
		Z(q)=phi(p,1);
		p=p+1;
		q=q+1;
	end;
	plot(X,Z)
  xlabel('time (s)')
  ylabel('psi')
	hold on
	ylim([min(phi) max(phi)])
	hold off
	pause(0.1)
end;
