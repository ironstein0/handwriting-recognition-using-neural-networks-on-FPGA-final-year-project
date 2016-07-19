
import os
import locate_file
import sys

command = ''
shared_object_library_extension = ''

if sys.platform == 'darwin' : 
	print('platform : darwin')
	command = 'clang'
	shared_object_library_extension = 'so'
elif sys.platform == 'win32' :
	print('platform win32')
	command = 'gcc'
	shared_object_library_extension = 'dll'
else : 
	raise TypeError('unsupported operating system, only windows and mac osx supported')

working_directory = locate_file.locate_file()
os.chdir(working_directory)
c_file_name = 'image_processing.c'
object_file_name = 'image_processing.o'
shared_object_library_name = 'image_processing.{0}'.format(shared_object_library_extension)

#compiling convolution.c
def compile() : 
	for i in range(3) : 
		os.system('echo ------------------------------------')
	print('compiling ' + c_file_name)
	os.system('cd ' + working_directory)
	os.system('{0} -c '.format(command) + c_file_name)
	os.system('{0} -o {1} -shared {2}'.format(command,shared_object_library_name,object_file_name))
	os.system('file {0}'.format(shared_object_library_name))

if shared_object_library_name not in os.listdir(working_directory) :
	compile()