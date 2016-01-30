from functools import wraps

class debug() : 
	def __init__(self,*args,**kwargs) : 
		self.args = args

	def __call__(self,func) : 

		@wraps(func)
		def wrapper(*args,**kwargs) : 
			print('entering ' + func.__name__)
			return(func(*args))
			print('exiting ' + func.__name__)
		return wrapper


# class logs() : 
# 	def __init__(self,*Args,**kwargs) :
# 		self.args = args
# 		print(self.args)

# 	def __call__(self,func) : 

# 		@wraps(func) 
# 		def wrapper(*Args,**kwargs) : 
# 			print('to be edited as of now')
# 		return wrapper

# def debug(*arg,**kwarg) : 
# 	def wrapper_function(func) : 
# 		def wrapper(*args,**kwargs) : 
# 			print('entering ' + func.__name__)
# 			func(*args,**kwargs)
# 			print('exiting ' + func.__name__)
# 		return wrapper
# 	return wrapper_function