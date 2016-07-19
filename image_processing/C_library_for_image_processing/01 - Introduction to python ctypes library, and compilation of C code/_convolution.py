import ctypes
import numpy as np
import locate_file
working_directory = locate_file.locate_file()

_convolution_ = ctypes.cdll.LoadLibrary(working_directory + 'libconvolution.so')

class two_dimensional_matrix_() : 
    
    def from_param(self,param) : 
        typename = type(param).__name__
        if hasattr(self,'from_'+typename) : 
            return getattr(self,'from_'+typename)(param)
        else : 
            raise TypeError('cant convert %s' %typename)
    
    #for a list
    def from_list(self,param) : 
        
        c_array = ((ctypes.c_int * len(param))*len(param[0]))()
        for i in range(len(param)) : 
            for j in range(len(param[i])) :
                c_array[i][j] = ctypes.c_int(param[i][j])
        return c_array
    
    #for a tuple
    def from_tuple(self,param) : 
        return self.from_list(param)
    
    #for a numpy array
    def from_ndarray(self,param) : 
        
        c_array = ((ctypes.c_int * len(param))*len(param[0]))()
        for i in range(len(param)) : 
            for j in range(len(param[i])) : 
                c_array[i][j] = ctypes.c_int(param[i][j])
        return c_array
    
two_dimensional_matrix = two_dimensional_matrix_()
_convolution_.convolution.argtypes = [two_dimensional_matrix,two_dimensional_matrix,ctypes.c_int,ctypes.c_int,\
                                     ctypes.c_int,ctypes.c_int]
_convolution_.convolution.restypes = ctypes.c_void_p