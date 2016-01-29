import os
FILE = __file__

def get_working_directory() : 
	global FILE

	import sys
	SYSTEM_PATH_SEPERATOR = ''
	if(sys.platform.startswith('darwin')) : 
		SYSTEM_PATH_SEPERATOR = '/'
	elif sys.platform.startswith('win') : 
		SYSTEM_PATH_SEPERATOR = '\\'
	else : 
		raise ValueError

	directory = FILE.split(SYSTEM_PATH_SEPERATOR)[:-2]
	temp_directory = ''
	for element in directory : 
		temp_directory += element + SYSTEM_PATH_SEPERATOR
	directory = temp_directory
	return directory

os.chdir(get_working_directory())