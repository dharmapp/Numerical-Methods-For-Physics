import numpy as np
import math
import matplotlib as plt
import random

x=[0 for i in range (10)]
for i in range (10):
    x[i]=i+1
    
for i in range (10):
    print(x[i], end=" ")

#penjumlahan
sum=0
for i in range(10):
    sum=sum+x[i]

#rata-rata
n=len(x) #panjang array x
avg=sum/n


#variansi
var=0
for i in range (n):
    var=var+(x[i]-avg)**2
    
std=math.sqrt(var/n)
    
print("sum=", sum)
print("avg =", avg)
print("var =", var)
print("std =", std)
