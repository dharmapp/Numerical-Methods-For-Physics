# Menghitung Integral Gaussian Menggunakan Jumlah Riemann Partisi Persegi dengan Python
# Dibuat oleh Dharma P. Permana
# email: dhp.permana@gmail.com

import numpy as np

def fungsi(x,r,a):
    fx = (x**r)*np.exp(-a*(x**2))
    return fx

print("Mencari Integral Gaussian")
print()
print("x^r exp(-ax^2)")
print()
print("r = orde Gaussian")
print("a = koefisien Gaussian")
print("Menggunakan sifat simetri dari fungsi Gaussian")
print()

xo=0 #xo adalah batas bawah integrasi

r=int(input("orde integral Gaussian, r: "))
a=float(input("koefisien Gaussian, a: "))
print()
if (r%2 == 0):
  print("Gaussian genap ber-orde r="+str(r)+" dan koefisien a= "+str(a))
else:
  print("Gaussian ganjil ber-orde r="+str(r)+" dan koefisien a= "+str(a))
print()
print()

b=4
n=int(input("jumlah partisi, n: "))

print()

#main code
x=xo
delta=(b-xo)/n #delta adalah lebar partisi
sum=0
for i in range(n):
    sum = sum + fungsi(x,r,a)*delta
    x=x+delta

if (r%2 == 0):
    print("Hasil Integral Gaussian: ",2*sum)

else :
    print("Hasil Integral Gaussian: ",sum)
