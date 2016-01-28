import mnist_loader
import matplotlib.pyplot as ppt
training_data, validation_data, test_data = mnist_loader.load_data_wrapper()
import network
import pylab

net = network.Network([784, 30, 10])

def looping(b,c,x):
    
    for j in range (0,8):
    	for k in range(0,10):
    		if (c >= x+1):
    			c = x
            location = ["C:\Users\Akash\Pictures\Neural_Net_graphs2\\"]
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