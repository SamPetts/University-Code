
###############################################################################

# ws04/01_indentationError

###############################################################################

def indentationError(f, x):
    for n in range(1000):
        x = x + f(x)
        if x > 10:
            return n


###############################################################################

# ws03/02_lbyl

###############################################################################

 def lbyl(x):
    if x<=0:
        raise Exception ("Not Possible, Negative Log")
    import numpy as np
    return np.log(x)

###############################################################################

# ws04/03_intExpSin

###############################################################################

from scipy.integrate import quad
from numpy import inf
from numpy import exp, sin
def f(x):
    return y=sin(x)*exp**(-x)
intExpSin = quad (f,0,inf)
intExpSin = intExpSin[0]


###############################################################################

# Total = 3
