#------------------------ CONSTANTS ---------------------------
hidden_layer_neurons = 30
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
    saving_directory.append('test_results')
    temp_saving_directory = ''
    for element in saving_directory : 
        temp_saving_directory += element + SYSTEM_PATH_SEPERATOR
    saving_directory = temp_saving_directory
    
    return saving_directory

SAVING_DIRECTORY = get_saving_directory()
print(SAVING_DIRECTORY)

import mnist_loader
import matplotlib.pyplot as ppt
training_data, validation_data, test_data = mnist_loader.load_data_wrapper()
import network
import pylab

net = network.Network([784, 30, 10])

def looping(b,c,x):
    global SAVING_DIRECTORY
    
    for j in range (0,8):
    	for k in range(0,10):
            if (c >= x+1):
                c = x
            location = [SAVING_DIRECTORY]
            temp = []
            epoch_efficiency_list = net.SGD(training_data,a,b,c,test_data = test_data)
            t = []
            for i in range(len(epoch_efficiency_list)): t.append(i)
            ppt.plot(t,epoch_efficiency_list, 'b-')
            temp.append(str(a))
            temp.append(str(b))
            temp.append(str(c))
            temp = ".".join(temp)
            location = location[0] + temp
            print(location)
            ppt.savefig('%s.png' % location)
            ppt.clf()
            location = ""
            pylab.ylim([0,10000])
            c += 0.1
            c = float("{0:.2f}".format(c))
    	b = b + 5

looping(5,2,1)

looping(5,3,2)

looping(5,4,3)