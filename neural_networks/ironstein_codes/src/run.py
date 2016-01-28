#------------------------ CONSTANTS ---------------------------
hidden_layer_neurons = 10
eta = 3.0
epochs = 10
mini_batch_size = 10
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
	saving_directory.append('results')
	temp_saving_directory = ''
	for element in saving_directory : 
		temp_saving_directory += element + SYSTEM_PATH_SEPERATOR
	saving_directory = temp_saving_directory
	
	return saving_directory

SAVING_DIRECTORY = get_saving_directory()

import mnist_loader
import network
training_data,validation_data,test_data = mnist_loader.load_data_wrapper()
#----------------------------------------------------------------

net = network.Network([784,hidden_layer_neurons,10])
net.SGD(training_data, epochs, mini_batch_size, eta, test_data=test_data)