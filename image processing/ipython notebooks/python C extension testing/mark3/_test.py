
import numpy
import ctypes

_test_ = numpy.ctypeslib.load_library('test','.')
_test_.for_loop_test_without_register_values.argtypes = [ctypes.c_int]
_test_.for_loop_test_without_register_values.restype = ctypes.c_void_p
_test_.for_loop_test_with_register_values.argtypes = [ctypes.c_int]
_test_.for_loop_test_with_register_values.restype = ctypes.c_void_p

def C_for_test_without_register_values(n) : 
    _test_.for_loop_test_without_register_values(n)
    
def C_for_test_with_register_values(n) : 
    _test_.for_loop_test_with_register_values(n)