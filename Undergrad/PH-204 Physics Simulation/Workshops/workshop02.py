

###############################################################################

# ws02/01_uniquify

###############################################################################

def uniquify(a):
    x = set(a)
    print(x)
    
    pass

###############################################################################

# ws02/02_mutability

###############################################################################

def mutability(obj):
    if type(obj) == list or type(obj) == dict or type(obj) == set:
        return (True)
    else:
        return (False)
    pass

###############################################################################

# ws02/03_thereAndBackAgain

###############################################################################

def thereAndBackAgain(a):
    """Accept a list and return a new list with the reverse tacked on the end"""
    if type (a) == list:
     b = [a[:],a[::-1]
        a.append (b)
        print (a)
    else:
        print ("Needs to be a list")
    pass
        
        
    pass

def thereAndBackInPlace(a):
    """Modify a list in place so that it contains the reverse of itself tacked on the end"""
   
        b = a[::-1]
        a.append (b)
        print (a)
    
###############################################################################

# ws02/04_zeroOffDiags

###############################################################################

def zeroOffDiags(A):
    pass

###############################################################################

# ws02/05_plotBlackBody

###############################################################################

from urllib import request
with request.urlopen("http://jamesbateman.eu/PH-204/src/spectrum.txt") as response:
    contents = response.read()

with open("spectrum.txt", 'wb') as handle:
    handle.write(contents)

