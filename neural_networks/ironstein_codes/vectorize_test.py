from functools import wraps

def vectorize(function) : 

	@wraps(function)	# to preserve all the "function" attributes wich would else be lost	
	def wrapper(vector) :

		# check if the vector is an iterable object (such as a list or tuple)
		# or is it a non iterable object (such as an integer)
		# so as to make the vectorized function universal
		try :
			iter(vector)
		except TypeError :
			return function(vector)

		return_vector = []
		for element in vector : 
			return_vector.append(function(element))
		return return_vector

	return wrapper

@vectorize
def square(number) : 
	return number**2;

print(square([2,3,4,5]))