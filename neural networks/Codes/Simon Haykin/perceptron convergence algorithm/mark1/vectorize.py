class vectorize() : 
	def __init__(self,function) :
		self.function = function

	def __call__(self = None,*args,**kwargs) :

		# print('arguments --> ',*args)
		if((type(args[0]) != type([])) and (type(args[0]) != type(()))) : 
			return self.function(self,*args,**kwargs)

		else : 
			result = []
			arguments = [[] for i in range(len(args[0]))]
			for i in range(len(args[0])) : 
				argument = []
				for j in range(len(args)) :
					argument.append(args[j][i])
				arguments[i] = argument
			for a in arguments : 
				result.append(self.function(self,*tuple(a)))
			return result

# class test_class() : 

# 	def __init__(self) : 
# 		self.test_method([1],[2]) 

# 	@vectorize
# 	def test_method(self,*args) : 
# 		print(args)

# test_class()
	
# @vectorize
# def just_testing(*args) : 
# 	sum = 0
# 	for a in args : 
# 		sum += a
# 	return sum

# print(just_testing([0,0,0,0,1,1,1,1],[0,0,1,1,0,0,1,1],[0,1,0,1,0,1,0,1]))
# print(just_testing(1,2,3))