import gzip
import pickle
import numpy

def __init__() : 

	with gzip.open('data/mnist.pkl.gz','rb') as f : 
		data = pickle.load(f,encoding='ISO-8859-1')

	return numpy.array([reshape_data(x) for x in data])

def reshape_data(data) : 
	inputs = [numpy.reshape(x, (784, 1)) for x in data[0]]
	results = [vectorized_result(y) for y in data[1]]
	data = zip(inputs,results)
	return_data = []
	for i in range(100000) :
		try :  
			return_data.append(data.__next__())
		except StopIteration : 
			break
	return return_data

def vectorized_result(digit) : 
	return_array = numpy.zeros((10,1)) 
	return_array[digit] = 1
	return return_array`