###This code is written in Python by Dharma P. Permana###
#any complain or question, please email: dhp.permana@gmail.com

###Damped Harmonic Oscillator###
# y" + by' + cy = 0 
# or
# y" = -by' - cy 
# with y'=v and v'=y" 
# such that v' = -bv - cy

import matplotlib.pyplot as plt
import numpy as np

#physical coefficient
b = 1 #damping coefficient
k = 10 #spring constant
m = 1 #mass attached to spring
c = k/m 

#partition initializatin
delta = 0.05 #partition (step) size
to = 0 #initial time
tf = 20 #final time
n = int(np.round((tf-to)/delta)) #numbers of data point

#boundary condition
yo=0 #initial position
vo=1 #initial velocity

#data array initialization
t=[0 for i in range(n)] #matrix for time data
y=[0 for i in range(n)] #matrix for position data obtained from RK4 
y_eu=[0 for i in range(n)] #matrix for position data obtained from Simple Euler 
v_eu=[0 for i in range(n)] #matrix for velocity data obtained from Simple Euler 
v=[0 for i in range(n)] #matrix for velocity data obtained from RK4

#input all boundary condition to the matrices
y[0]=yo 
v[0]=vo
yo_eu = yo
vo_eu = vo
y_eu[0]=yo_eu
v_eu[0]=vo_eu

#Main Code
for i in range(n):
  #Runge-Kutta 4
  k1 = vo
  q1 = -b*vo - c*yo
  k2 = vo + 0.5*delta*q1
  q2 = -b*(vo+0.5*delta*q1)-c*(yo+0.5*delta*k1)
  k3 = vo + 0.5*delta*q2
  q3 = -b*(vo+0.5*delta*q2)-c*(yo+0.5*delta*k2)
  k4 = vo + delta*q3
  q4 = -b*(vo+delta*q3)-c*(yo+delta*k3)
  y[i]=yo + (1/6)*delta*(k1+2*k2+2*k3+k4)
  v[i]=vo + (1/6)*delta*(q1+2*q2+2*q3+q4)
  yo = y[i]
  vo = v[i]

  #Simple Euler
  y_eu[i] = yo_eu + delta*(vo_eu)
  v_eu[i] = vo_eu + delta*(-b*vo_eu - c*yo_eu)
  yo_eu = y_eu[i]
  vo_eu = v_eu[i]

  #Update time data
  t[i]=to + delta
  to = t[i]

#Making plot 
plt.plot(t,y,t,y_eu,t,v,t,v_eu) #making plot
plt.legend(["position-RK","velocity-RK","position-EU","velocity-EU"]) #making legend for each curve
plt.xlabel("time") #labeling the x-axis
plt.title("mass, m= "+str(m)+";"+"damping coeff, b= "+str(b)+";"+"spring constant k= "+str(k)) #creating plot title
plt.show() #showing plot
