#!/usr/bin/python3

####################################################################################

def norm(v):
    from numpy import sqrt
    return sqrt(v @ v)

import numpy as np
A=np.array([2.83, -2, 2])
B=np.array([1.5, 2.56, 0.44])
norm(A+B)

####################################################################################
#INCOMPLETE

def predcorr(f, x0, dt):
    tn = 0
    xn = x0
    while True:
        yield tn, xn
        xprime = xn+f(tn,xn)dt
        xn = xn + 1/2[f(tn,xn)+f(tn+dt, xprime)]dt
        tn = tn + dt

