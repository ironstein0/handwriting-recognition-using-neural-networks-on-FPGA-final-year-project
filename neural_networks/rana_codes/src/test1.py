# import mnist_loader
# training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

# import network

# # creating a network (loading a class)
# net = network.Network([784, 30, 10])

# # start training with 30 epochs, mini_batch_size = 10 , eta = 3
# net.SGD(training_data,1,1000,1.0,test_data = test_data)

# def test(lin_im, row_length = 28):
#     temp = [row[0] for row in lin_im]
#     # display([temp[k:k+row_length] for k in range(0,len(temp),row_length)])
#     print("the network identifies it as " + str(net.net_output(lin_im)))

# test(test_data[0][0])

import mnist_loader
import matplotlib.pyplot as ppt
training_data, validation_data, test_data = mnist_loader.load_data_wrapper()
import network

net = network.Network([784, 30, 10])
a = 25
b = 5
c = 1.0

# for j in range(0,6): 
#     for k in range(0,10):
#     	if (c >= 2):
#     		c = 1
#         location = ["C:\Users\Akash\Pictures\Neural_Net_graphs1\\"]
#         temp = []
#         epoch_efficiency_list = net.SGD(training_data,a,b,c,test_data = test_data)
#         t = []
#         for i in range(len(epoch_efficiency_list)): t.append(i)
#         ppt.plot(t,epoch_efficiency_list, 'b-')
#         temp.append(str(a))
#         temp.append(str(b))
#         temp.append(str(c))
#         temp = ".".join(temp)
#         location = location[0] + temp
#         print(location)
#         ppt.savefig('%s.png' % location)
#         ppt.clf()
#         location = ""
#         epoch_efficiency_list = []
#         c += 0.1
#         c = float("{0:.2f}".format(c))
#     b += 5

# for j in range(0,6): 
#     for k in range(0,10):
#     	if (c >= 3 ):
#     		c = 2
#         location = ["C:\Users\Akash\Pictures\Neural_Net_graphs1\\"]
#         temp = []
#         epoch_efficiency_list = net.SGD(training_data,a,b,c,test_data = test_data)
#         t = []
#         for i in range(len(epoch_efficiency_list)): t.append(i)
#         ppt.plot(t,epoch_efficiency_list, 'b-')
#         temp.append(str(a))
#         temp.append(str(b))
#         temp.append(str(c))
#         temp = ".".join(temp)
#         location = location[0] + temp
#         print(location)
#         ppt.savefig('%s.png' % location)
#         ppt.clf()
#         location = ""
#         epoch_efficiency_list = []
#         c += 0.1
#         c = float("{0:.2f}".format(c))
#     b += 5

# for j in range(0,6): 
#     for k in range(0,10):
#     	if (c >= 4):
#     		c = 3
#         location = ["C:\Users\Akash\Pictures\Neural_Net_graphs1\\"]
#         temp = []
#         epoch_efficiency_list = net.SGD(training_data,a,b,c,test_data = test_data)
#         t = []
#         for i in range(len(epoch_efficiency_list)): t.append(i)
#         ppt.plot(t,epoch_efficiency_list, 'b-')
#         temp.append(str(a))
#         temp.append(str(b))
#         temp.append(str(c))
#         temp = ".".join(temp)
#         location = location[0] + temp
#         print(location)
#         ppt.savefig('%s.png' % location)
#         ppt.clf()
#         location = ""
#         epoch_efficiency_list = []
#         c += 0.1
#         c = float("{0:.2f}".format(c))
#     b += 5

# for i in range(0,6):
# 	for j in range(0,6):
# 		for k in range(1,10):
# 			print (a,b,c)
# 			c += 0.1
# 		b += 5
# 	c += 5

def looping(b,c,x):
    
    for j in range (0,8):
    	for k in range(0,10):
    		if (c >= x+1):
    			c = x
            location = ["C:\Users\Akash\Pictures\Neural_Net_graphs1\\"]
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
            
    		c += 0.1
    		c = float("{0:.2f}".format(c))
    	b = b + 5

# b = 5

# for j in range (0,8):
# 	for k in range(0,10):
# 		if (c >= 3):
# 			c = 2
# 		print(b,c)
# 		c += 0.1
# 		c = float("{0:.2f}".format(c))
# 	b = b + 5

# b = 5

# for j in range (0,8):
# 	for k in range(0,10):
# 		if (c >= 4):
# 			c = 3
# 		print(b,c)
# 		c += 0.1
# 		c = float("{0:.2f}".format(c))
# 	b = b + 5
looping(5,2,1)
looping(5,3,2)
looping(5,4,3)