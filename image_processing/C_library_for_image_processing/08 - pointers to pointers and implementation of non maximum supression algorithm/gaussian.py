import math
import matplotlib.pyplot as plt
import matplotlib
import numpy

class gaussian() : 

	def __init__(self) : 
		pass

	def generate_gaussian_smoothening_kernel(self,sigma) : 

		def calculate_kernel_size(sigma) : 
			minimum_kernel_size = int(1 + 2*((-2*sigma*math.log(0.005))**0.5))
			if minimum_kernel_size%2 is 0 :
				minimum_kernel_size += 1
			return minimum_kernel_size

		kernel_size = calculate_kernel_size(sigma) 
		# kernel_size = 5
		center_x = (kernel_size-1)/2
		center_y = (kernel_size-1)/2
		
		kernel = []

		def calculate_gaussian_function_value(x,y) : 
			try :
				return (math.e)**((x**2 + y**2)/(-2*(sigma**2)))
			except ZeroDivisionError : 
				return (math.e)**((x**2 + y**2)/(-2*(0.5**2)))
		sum_ = 0

		#generate the kernel
		for i in range(kernel_size) :
			kernel.append([])
			for j in range(kernel_size) :
				value = calculate_gaussian_function_value(i-center_y,j-center_x)
				kernel[i].append(value)
				sum_ += value

		#normalize the kernel

		max_ = max([max(element) for element in kernel])
		normalized_kernel = []
		for i in range(kernel_size) :
			normalized_kernel.append([])
			for j in range(kernel_size) : 
				normalized_kernel[i].append(int(255*kernel[i][j]/max_))

		kernel_normalizer = sum([sum(element) for element in normalized_kernel])
		print(kernel_normalizer)
		return [kernel_normalizer,normalized_kernel]
		