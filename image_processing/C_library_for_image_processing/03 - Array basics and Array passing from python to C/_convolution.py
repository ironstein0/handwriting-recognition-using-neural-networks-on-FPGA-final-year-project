import ctypes
import numpy
import locate_file
working_directory = locate_file.locate_file()

_convolution_ = ctypes.cdll.LoadLibrary(working_directory + 'libconvolution.so')

class image_type() : 
    
    def from_param(self,param) : 
        typename = type(param).__name__
        if hasattr(self,'from_'+typename) : 
            return getattr(self,'from_'+typename)(param)
        elif isinstance(param,ctypes.Array) : 
            
            return param
        else : 
            raise TypeError('type %s not supported' %typename) 
    
    def from_ndarray(self,param) : 
        c_array = numpy.ascontiguousarray(param)
        pointer = c_array.ctypes
        return pointer
    
    def from_list(self,param) : 
        return self.from_ndarray(param)
    
    def from_tuple(self,param) : 
        return self.from_ndarray(param)
    
image_type_ = image_type()
    
_convolution_.convolution.argtypes = [image_type_,ctypes.c_int,ctypes.c_int]
_convolution_.convolution.restype = ctypes.c_void_p

def convolution(array) : 
    c_array = numpy.ascontiguousarray(array,dtype=numpy.uint32)
    _convolution_.convolution(c_array,len(array),len(array[0]))
    return c_array