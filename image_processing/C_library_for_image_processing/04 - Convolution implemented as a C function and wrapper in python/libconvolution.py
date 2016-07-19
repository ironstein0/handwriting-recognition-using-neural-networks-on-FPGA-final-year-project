import ctypes
import locate_file
import numpy

working_directory = locate_file.locate_file()

_convolution_ = ctypes.cdll.LoadLibrary(working_directory + 'convolution.so')

class two_d_array() : 
    
    def from_param(self,param) : 
        typename = type(param).__name__
        if hasattr(self,'from_'+typename) : 
            return getattr(self,'from_'+typename)(param)
        elif isinstance(param,ctypes.Array) : 
            
            return param
        else : 
            raise TypeError('type %s not supported' %typename)
    
    def from_ndarray(self,param) : 
        c_array = numpy.ascontiguousarray(param,dtype=numpy.uint32)
        pointer = c_array.ctypes
        return pointer
    
    def from_list(self,param) : 
        return self.from_ndarray(param)
    
    def from_tuple(self,param) : 
        return self.from_ndarray(param)
    
two_d_array_ = two_d_array()

_convolution_.convolution.argtypes = [two_d_array_,two_d_array_,ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_int]
_convolution_.convolution.restype = ctypes.c_void_p

def convolution(image,kernel,kernel_normalizer) : 
    '''
    ADD BORDER TO IMAGE
    '''
    image_c_array = numpy.ascontiguousarray(image,dtype=numpy.uint32)
    kernel_c_array = numpy.ascontiguousarray(kernel,dtype=numpy.uint32)
    _convolution_.convolution(image_c_array,kernel_c_array,len(image[0]),len(image),len(kernel),kernel_normalizer)
    '''
    REMOVE BORDER FROM IMAGE
    '''
    return numpy.ascontiguousarray(image_c_array,dtype=numpy.uint8)