#!/usr/bin/python3

####################################################################################
# Estimate pi
####################################################################################

import numpy as np
from math import sqrt
random=np.random.random
inside=0
n=1000000
for i in range(0,n):
	x=random()
	y=random()
	if sqrt(x**2+y**2)<=1:
		inside+=1

		
pi=4*inside/n
pi

####################################################################################
# Maxwell–Boltzmann speed distribution
####################################################################################

#INCOMPLETE

import matplotlib.pyplot as plt
randn = np.random.randn

#random numbers from gaussian width 300 = them too vx, vy, vz, calc absv. plot histogram

####################################################################################
