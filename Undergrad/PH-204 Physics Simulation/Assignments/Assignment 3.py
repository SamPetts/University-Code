# -*- coding: utf-8 -*-
"""
Created on Wed Dec 13 12:01:51 2017

@author: 905664
"""

import numpy as np
from numpy import random
import matplotlib.pyplot as plt
import matplotlib.animation as animation
alpha=1.8
x=64
y=64
rsg=(2*(random.random([x,y])< 0.5)-1)

#plt.imshow(rsg, interpolation='none', vmin = -1, vmax = +1)
#plt.show()

#Pick random site



#def en0(rsg, x, y):
 #   return (-1*rsg[x,y])*(rsg[(x+1)-64,y]+rsg[x,(y+1)-64]+rsg[x-1,y]+rsg[x,y-1])
    
def en1(rsg,x,y):
    return rsg[x,y]*(rsg[x+1-64,y]+rsg[x,y+1-64]+rsg[x-1,y]+rsg[x,y-1])
    

    
def a(rsg,alpha):
    for g in range(1000):
        i=random.randint(64)
        j=random.randint(64)
        e1=en1(rsg,i,j)
        #e1=en1(rsg,i,j)
        if 0>(2*e1):
            rsg[i,j]*=-1
        elif np.exp(-2*e1/alpha)>random.random(1):
                    rsg[i,j]=-1*rsg[i,j]
        
        
            
fig = plt.figure()
frames = list()
           
for g in range(100):
    a(rsg,alpha)
    img = plt.imshow(rsg.copy(),interpolation='none',animated=True)
    frames.append([img]) 
    
ani = animation.ArtistAnimation(fig, frames, interval=40, blit=True)
plt.show()





Mag=list()
alphas=list()
rsgEN=(2*(random.random([x,y])< 0.5)-1)

alpha=np.linspace(3.5, 0.5,31)
def c():
    for i in range (31):
            for j in range (1):
                a(rsgEN,alphas)
                M=np.mean(rsgEN)
                Mag.append(M)

c()
plt.plot(alpha,Mag)
plt.show()


##Penning ion Trap##
#B0=1
#E0=10**3
#Traj=[x,y,z]

#def B[z]:
#    B0*z
#    return B
#def E[x,y,z]:
#    E0*(x+y-2*z)
#    return E
    
#def F[q,E,v,B]:
#    q(E+(np.cross(v,B)))
#    return F
    
    
    
