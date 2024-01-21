### Monte Carlo Intgral with Python###
### by Dharma P. Permana

### for Question or feedback, please email: dhp.permana@gmail.com

#Module Used
import random as rd
import numpy as np
import matplotlib.pyplot as plt

#initializing function for integral this
def fx(x): #this is a function with single argument 'x'
  fx = 2*x #this is a test function
  return fx

#parameters initialization
xo = 0 #lower limit of integration
xf = 10 #upper limit of integration
n = 100000 #number of iteration
delta = (xf-xo)/n #partition (step) size

#matrix initialization 
x = [0 for i in range(n)] #matrix containing coordinate of x
x_rand = [0 for i in range(n)] #matrix containing all the random x point
avg = [0 for i in range(n)] #matrix containing averaged value of the function
I = [0 for i in range(n)] #matrix containing the value of integral for each randomized point x


#main code of integration
xo_rand = xo #initial value of x coordinate for randomization
x[0]=xo #initial value of x coordinate
sum = 0 #initial value of summation
for i in range(n):
  x[i] = xo + delta #update the value of x coordinate
  q = rd.random()*(xf-xo_rand)+xo_rand #randomize the value of q between the upper and lower limits of integral
  x_rand[i] = q #update the value of random x data
  sum = sum + fx(q) #update the sum value
  avg[i] = sum/(i+1) #average of the function 
  I[i] = avg[i]*(xf-xo_rand) 
  xo = x[i] #update the value of initial x position as the latest 
  
#avg = sum/n #average value of the function
#integral = I[n-1] #the value of integral is function average multiplied by the interval
#print("Integral result: ",integral)

#this is for plotting the average value of integral
F=I[n-1] #final average value of integral
Integral = [F for i in range(n)] #matrix containing average value of integral

#plotting the distribution of integral values
plt.plot(x_rand,I,'.',x,Integral)
plt.xlabel("x")
plt.ylabel("Value of Integral")
plt.legend(["N point: "+str(n),"Averaged Value of Integral= "+str(F)])
