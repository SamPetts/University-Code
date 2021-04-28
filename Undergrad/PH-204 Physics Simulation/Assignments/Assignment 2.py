
import numpy as np

#Runge-Kutta method,used for solving ODE's numerically
#define 'f' as the initial function, x0 is the first value of x and h is the step value.
def rk4 (f,x0,h):
     tn=0
     xn=x0
     while True: 
         yield tn, xn
         k1=f(tn,xn)*h
         k2=f(0.5*h+tn,0.5*k1+xn)*h
         k3=f(0.5*h+tn,0.5*k2+xn)*h
         k4=f(tn+h,xn+k3)*h
         xn=xn+((1/6)*(k1+2*(k2+k3)+k4))
         tn=tn+h
 #RK4 algorithm defined 
 
def f(t,x): return -x
A = np.zeros((100,2))
sim = rk4(f, 1, 0.1)
for n in range(100):
     tn, xn = next(sim)
     A[n] = tn, xn
 
 #Task 2, importing data
name=np.genfromtxt("P:/Documents/Python/bodies.csv",delimiter=",",usecols=(0),skip_header=1,dtype=str)
masses=np.array([np.genfromtxt("P:/Documents/Python/bodies.csv",delimiter=",",usecols=(1),skip_header=1)])
x0=np.array([np.genfromtxt("P:/Documents/Python/bodies.csv", delimiter=",", usecols=(2,3,4,5,6,7), skip_header=1)])
   #easier than copying all the data from a file, does it automatically


#Task 3, Gravitational Acceleration
x=np.array([np.genfromtxt("P:/Documents/Python/bodies.csv", delimiter=",", usecols=(2), skip_header=1)])
y=np.array([np.genfromtxt("P:/Documents/Python/bodies.csv", delimiter=",", usecols=(3), skip_header=1)])
m=np.array([np.genfromtxt("P:/Documents/Python/bodies.csv", delimiter=",", usecols=(1), skip_header=1)])

def acc(x,y,m): #defining Newtons Law of Gravity
     r=y-x
     rmag=np.sqrt(r@r)
     rhat=r/rmag
     G=6.67*10**-11
     a=-G*m*rhat/rmag
     return a

def f(x):
     accvel=np.zeros([24,6])
     accvel[:,0:3]=x0[:,3:6]
     for i in range (24):
         for j in range (24):
             if i != j:
                 accvel[j,3:6]+=acc(x,y,m)

 #putting it all together
sim=rk4(f,x0,h=600)
solutions=list()
for n in range (10**4):
     solutions. append(next(sim))
print(n)
