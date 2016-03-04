#----------------------- INITIALIZATION ------------------------
import sys
SYSTEM_PATH_SEPERATOR = ''
if(sys.platform.startswith('darwin')) : 
	SYSTEM_PATH_SEPERATOR = '/'
elif sys.platform.startswith('win') : 
	SYSTEM_PATH_SEPERATOR = '\\'
else : 
	raise OSError('unsupproted operating system')

def generate_path(string_list) : 
	global SYSTEM_PATH_SEPERATOR
	return_string = ''
	for element in string_list : 
		return_string += element
		return_string += SYSTEM_PATH_SEPERATOR
	return return_string

def get_directory() : 
	saving_directory = __file__.split(SYSTEM_PATH_SEPERATOR)[:-2]
	saving_directory.extend(['data','chars_74K_dataset'])
	saving_directory = generate_path(saving_directory)
	temp_saving_directory = ''
	return saving_directory

DATASET_DIRECTORY = get_directory()	#chars_74K_dataset
print(DATASET_DIRECTORY)
#----------------------------------------------------------------

import ast

with open(DATASET_DIRECTORY+'chars_74K.txt','r') as f : 
	dataset = f.read()

l = ast.literal_eval(dataset)