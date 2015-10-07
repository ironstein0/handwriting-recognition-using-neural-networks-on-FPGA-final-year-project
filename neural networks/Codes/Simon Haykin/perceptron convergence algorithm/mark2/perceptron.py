from vectorize import vectorize

class perceptron() : 

	def __init__(self,x,d) : 
		self.X = x
		for i in range(len(self.X)) : 
			self.X[i].insert(0,1)

		self.d = d
		self.w = [0 for i in self.X[0]]
		self.y = [-1 for i in self.d]
		self.e = algebraic_methods.subtract(self.d,self.y)
		self.eta = 1
		self.m = [0 for i in self.X[0]]
		self.summation_x_misclassified_update()
		self.__print__()

		self.perceptron_convergence_algorithm()

	def __print__(self) : 
		print('-----------------------------------------------------')
		print('X -->', self.X)
		print('d -->', self.d)
		print('w -->', self.w)
		print('y -->', self.y)
		print('e -->', self.e)
		print('eta -->',self.eta)
		print('m -->',self.m)
		print('-----------------------------------------------------')

	def perceptron_convergence_algorithm(self) :
		count = 0
		while((self.y != self.d) and (count <= 100)) :
			print('count -->', count)
			self.summation_x_misclassified_update() 
			self.weight_update()
			self.output_update()
			count += 1
			print(self.y)

		return None

	def weight_update(self) :
		for e in self.e :
			self.w = algebraic_methods.add(self.w,algebraic_methods.multiply(self.eta,e,self.m))
			self.error_update()
			self.summation_x_misclassified_update()
			print(self.w)

		return None

	def summation_x_misclassified_update(self) :
		for (y,d,x) in zip(self.y,self.d,self.X) : 
			if(y != d) : 
				self.m = algebraic_methods.add(self.m,x)

		return None

	def error_update(self) :
		self.e = algebraic_methods.subtract(self.d,self.y)
		return None

	def output_update(self) :
		output_vector = [] 
		for x in self.X : 
			output_vector.append(algebraic_methods.signum(algebraic_methods.dot(x,self.w)))
		self.y = output_vector
		return None

class algebraic_methods() : 

	@staticmethod 
	@vectorize
	def add(*args) :
		sum = 0
		for argument in args : 
			sum += argument
		return sum

	@staticmethod
	@vectorize
	def subtract(a,b) :
		return (a - b)

	@staticmethod
	@vectorize
	def multiply(*args) :
		product = 1
		for argument in args : 
			product *= argument
		return product

	@staticmethod
	@vectorize
	def signum(v) :
		if(v >= 0) : 
			return 1
		else : 
			return -1

	@staticmethod
	def dot(a,b) :
		sum = 0
		for (i,j) in zip(a,b) :
			sum += i*j
		return sum

p = perceptron([[0,0],[0,1],[1,0],[1,1]],[-1,-1,-1,1])
q = perceptron([[0,0],[0,1],[1,0],[1,1]],[-1,1,1,1])
r = perceptron([[0,0,0,0],[1,1,1,1]],[1,-1])
