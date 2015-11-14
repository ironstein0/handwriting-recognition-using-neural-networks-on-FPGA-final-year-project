
import numpy
import ctypes

_convolution_ = numpy.ctypeslib.load_library('convolution','.')
_convolution_.array_testing.argtypes = [ctypes.c_int]
_convolution_.array_testing.restype = ctypes.c_void_p

def array_testing(array) : 
    _convolution_.array_testing(array)
    
# array = [1,2,2,3,4,5,56,6,7,7,8,8,9]
# array_testing(array)