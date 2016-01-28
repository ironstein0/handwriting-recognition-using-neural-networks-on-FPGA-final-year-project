
import numpy
import ctypes

_test_ = numpy.ctypeslib.load_library('test','.')
_test_.for_loop_test.argtypes = [ctypes.c_int]
_test_.for_loop_test.restype = ctypes.c_void_p

def C_for_test(n) : 
    _test_.for_loop_test(n)