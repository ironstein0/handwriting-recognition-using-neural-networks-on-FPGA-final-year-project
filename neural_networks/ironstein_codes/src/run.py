#------------------------ CONSTANTS ---------------------------
hidden_layer_neurons = 10
eta = 1.0
epochs = 15
mini_batch_size = 15
#--------------------------------------------------------------

#----------------------- INITIALIZATION ------------------------
import sys
SYSTEM_PATH_SEPERATOR = ''
if(sys.platform.startswith('darwin')) : 
	SYSTEM_PATH_SEPERATOR = '/'
elif sys.platform.startswith('win') : 
	SYSTEM_PATH_SEPERATOR = '\\'
else : 
	raise ValueError

def get_saving_directory() : 
	saving_directory = __file__.split(SYSTEM_PATH_SEPERATOR)[:-2]
	saving_directory.append('test_results')
	temp_saving_directory = ''
	for element in saving_directory : 
		temp_saving_directory += element + SYSTEM_PATH_SEPERATOR
	saving_directory = temp_saving_directory
	
	return saving_directory

GRAPHS_SAVING_DIRECTORY = get_saving_directory()

import mnist_loader
import network
training_data,validation_data,test_data = mnist_loader.load_data_wrapper()
#----------------------------------------------------------------
import matplotlib.pyplot as plt
import pylab

def loop() : 
	global GRAPHS_SAVING_DIRECTORY
	global mini_batch_size
	global epochs
	net = network.Network([784,hidden_layer_neurons,10])
	for eta in [i*0.1 for i in range(50)][1:] :
		performance_list = net.SGD(training_data, epochs, mini_batch_size, eta, test_data=test_data)
		epoch_list = [i for i in range(epochs)]
		plt.plot(epoch_list,performance_list,'b-')
		pylab.ylim([0,10000])
		plt.savefig(GRAPHS_SAVING_DIRECTORY + 'eta_' + str(eta) + '.png')

loop()