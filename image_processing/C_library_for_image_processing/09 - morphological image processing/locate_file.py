import sys

def locate_file() :  
	working_directory = ''
	for element in __file__.split('/')[:-1] :
		working_directory += element + '/'
	if sys.platform == 'darwin' : 
		return working_directory 
	elif sys.platform == 'win32' : 
		return 'C:/Users/dhree/Desktop/Projects/Handwriting_recognition_using_neural_nets_on_FPGA/TEST/6 - Implementing canny edge detector'