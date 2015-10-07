import random
from vectorize import vectorize
import time

class perceptron() : 
	def __init__(self,inputs,expected_outputs) :
		self.inputs = inputs
		for i in self.inputs : 
			i.insert(0,1)
		#print(inputs)
		self.expected_outputs = expected_outputs
		#print(self.expected_outputs)
		self.weights = [0 for i in range(len(self.inputs[0]) + 1)]
		# print(self.weights)
		self.learning_rate = [0 for i in range(len(self.expected_outputs))]
		self.perceptron_convergence_algorithm()

	def perceptron_convergence_algorithm(self) :
		count = 0
		generated_outputs = [0 for i in range(len(self.expected_outputs))]
		while((generated_outputs != self.expected_outputs) and count <= 10): 
			summation = [0 for i in range(len(self.inputs[0]))]
			#print(summation)
			for i in range(len(inputs)) :
				if(self.expected_outputs[i] != generated_outputs[i]) :
					#print(self.dot(self.weights,self.inputs[i]))
					summation = self.add(summation,self.inputs[i])

				output = self.dot(self.weights,self.inputs[i])
				generated_outputs[i] = self.signum(output)
				self.learning_rate[i] = self.expected_outputs[i] - generated_outputs[i]
			
			print(summation)
			error_vector = self.add(self.expected_outputs,self.multiply_scalar_to_vector(-1,generated_outputs))
			print(error_vector)
			delta_w = []
			for i in range(len(summation)) :
				delta_w.append(self.multiply_scalar_to_vector(error_vector[i],summation))
			print(delta_w)

			time.sleep(1)
			count += 1

	@vectorize
	def signum(self,input) :
		threshold = 0 
		if(input > threshold) : 
			return 1
		else : 
			return -1

	@vectorize
	def add(self,a,b) : 
		return(a+b)

	@vectorize
	def multiply(self,*args) : 
		product = 1
		for argument in args :
			product *= argument
		return product

	def dot(self,v1,v2) : 
		sum = 0
		for (x,y) in zip(v1,v2) : 
			sum += x*y
		return sum

	def multiply_scalar_to_vector(self,scalar,vector) : 
		result = []
		for element in vector : 
			result.append(scalar*element)
		return result

# inputs = [[-1,-1],[-1,1],[1,-1],[1,1]]
# outputs = [-1,-1,-1,1]
inputs = [[0,1],[1,0]]
outputs = [1,-1]
m = perceptron(inputs,outputs)
# print('[1,2,2,3,2,-2,-4,0,-2,3]')
# a = m.signum([1,2,2,3,2,-2,-4,0,-2,3])
# print(a)

# a = m.add([1,2,3],[4,5,6])
# print(a)