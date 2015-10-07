class vectorize() : 

	def __init__(self,function) : 
		self.function = function

	def __call__(self=None,*args,**kwargs) :

		if(self.function.__name__ == 'multiply') :
			scalar_arguments = []
			vector_arguments = []
			for argument in args : 
				if((type(argument) == type(1)) or (type(argument) == type(1.0))) :
					scalar_arguments.append(argument)
				else : 
					vector_arguments.append(argument)
			number_of_arguments = len(scalar_arguments) + len(vector_arguments)

			scalar_argument = 1
			for x in scalar_arguments : 
				scalar_argument *= x

			vector_argument = []
			if(len(vector_arguments) != 0) :
				vector_argument = [1 for element in vector_arguments[0]]

			for argument in vector_arguments :
				for i in range(len(argument)) : 
					vector_argument[i] *= argument[i]

			for i in range(len(vector_argument)) : 
					vector_argument[i] *= scalar_argument

			if(vector_argument != []) :
				return vector_argument
			else : 
				return scalar_argument

			# if(len(scalar_arguments) == number_of_arguments) :
			# 	scalar_argument = 1
			# 	for x in scalar_arguments : 
			# 		scalar_argument *= x

			# elif(len(vector_arguments) == number_of_arguments) : 
			# 	vector_argument = [1 for element in vector_arguments[0]]
			# 	for argument in vector_arguments :
			# 		for i in range(len(argument)) : 
			# 			vector_argument[i] *= argument[i]
			# 	return vector_argument

			# else : 
			# 	scalar_argument = 1
			# 	for argument in scalar_arguments : 
			# 		scalar_argument *= argument
			# 	vector_argument = [1 for element in vector_arguments[0]]
			# 	for argument in vector_arguments :
			# 		for i in range(len(argument)) : 
			# 			vector_argument[i] *= argument[i]
			# 	for i in range(len(vector_argument)) : 
			# 		vector_argument[i] *= scalar_argument
			# 	return(vector_argument)


		else : 
			if((type(args[0]) == type(1)) or (type(args[0]) == type(1.0))) : 
				return(self.function(*args))
			else : 
				result = []
				for i in range(len(args[0])) : 
					arguments = []
					for argument in args :
						arguments.append(argument[i])
					result.append(self.function(*tuple(arguments)))
				return result

# @vectorize
# def add(*args) : 
# 	sum = 0
# 	for argument in args : 
# 		sum += argument
# 	return sum

# @vectorize
# def subtract(a,b) : 
# 	return a-b

# @vectorize
# def signum(v,threshold = 0) : 
# 	if(v >= threshold) : 
# 		return 1
# 	else : 
# 		return -1

# @vectorize
# def multiply(*args) : 
# 	return(1)

# m = add(1,2)
# print(m)
# n = add([1,2],[3,4])
# print(n)
# o = subtract(1,2)
# print(o)
# p = subtract([1,2],[3,4])
# print(p)
# q = signum(3)
# print(q)
# r = signum([1,2,-2,0,-1])
# print(r)
# s = multiply(1,2,3)
# print(s)
# t = multiply([1,2],[3,4])
# print(t)
# u = multiply(3,2,[1,2],[3,4])
# print(u)