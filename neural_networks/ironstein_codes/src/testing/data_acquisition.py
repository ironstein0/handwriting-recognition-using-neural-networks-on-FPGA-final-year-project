#----------------------- INITIALIZATION ------------------------
import sys
SYSTEM_PATH_SEPERATOR = ''
if(sys.platform.startswith('darwin')) : 
	SYSTEM_PATH_SEPERATOR = '/'
elif sys.platform.startswith('win') : 
	SYSTEM_PATH_SEPERATOR = '\\'
else : 
	raise ValueError

def generate_path(string_list) : 
	global SYSTEM_PATH_SEPERATOR
	return_string = ''
	for element in string_list : 
		return_string += element
		return_string += SYSTEM_PATH_SEPERATOR
	return return_string

def get_directory() : 
	saving_directory = __file__.split(SYSTEM_PATH_SEPERATOR)[:-3]
	saving_directory.extend(['data','chars_74K_dataset'])
	saving_directory = generate_path(saving_directory)
	temp_saving_directory = ''
	return saving_directory

DATASET_DIRECTORY = get_directory()	#chars_74K_dataset
print(DATASET_DIRECTORY)
#----------------------------------------------------------------

import cv2
import numpy
import time
from debug import debug

def generate_integer_string(integer,number_of_characters) :
	l = [str(0) for j in range(number_of_characters-len(str(integer)))]
	if l == [] :
		print('generate_integer_string --> number_of_characters can not be less that the length of the intger')
		raise ValueError
	for element in str(integer) :
		l.append(element)
	string = ''
	for element in l : 
		string += element
	return string

def open_images() :	

	def generate_expected_output_list(i) : 
		return_list = []
		for j in range(1,63) :
			if j == i :
				return_list.append(1)
			else : 
				return_list.append(0)
		return return_list

	def rgb_to_bnw(image,mask=None) :
		mask_image = []
		if mask == None :
			mask_image = numpy.ones(image.shape[:-1],dtype=numpy.uint8)
			mask_image *= 255 
		else : 
			mask_image = numpy.zeros(image.shape[:-1],dtype=numpy.uint8)
			for i in range(len(mask)) : 
				for j in range(len(mask[i])) :
					mask_image[i][j] = sum(mask[i][j])/3.0
		return_image = numpy.zeros(image.shape[:-1],dtype=numpy.uint8)
		for i in range(len(image)) : 
			for j in range(len(image[i])) :
				return_image[i][j] = (sum(image[i][j])/3.0)*(mask_image[i][j]/255)
		return return_image

	def reshape(image) :
		#asssumes a black and white image as input (will not work with RGB image) 
		# @debug()
		def make_square(image) : 
			
			# @debug()
			def horizontal_stack(array_1,array_2) :
				if array_1.shape[0] != array_2.shape[0] :
					raise ValueError('both arrays should be of same heights') 
				return_array = numpy.zeros([array_2.shape[0],array_1.shape[1] + array_2.shape[1]],dtype=numpy.uint8)
				# print(array_1.shape)
				# print(array_2.shape)
				# print(return_array.shape)
				
				row_count = 0
				for row1,row2 in zip(array_1,array_2) :
					# print(numpy.append(row1,row2).shape) 
					return_array[row_count] = numpy.append(row1,row2)
					row_count += 1
				return return_array

			# @debug()
			def vertical_stack(array_1,array_2) : 
				if array_1.shape[1] != array_2.shape[1] : 
					raise ValueError('both arrays should be of same widths')
				return_array = numpy.zeros([array_1.shape[0] + array_2.shape[0],array_2.shape[1]],dtype=numpy.uint8)
				# print(array_1.shape)
				# print(array_2.shape)
				# print(return_array.shape)
				row_count = 0
				for row1 in array_1 : 
					return_array[row_count] = row1
					row_count += 1
				for row2 in array_2 : 
					return_array[row_count] = row2
					row_count += 1
				return return_array

			# @debug()
			def add_rows(image,image_width,image_height) : 
				rows_to_add = image_width - image_height
				concatenating_array_top = numpy.zeros([int(rows_to_add/2),image_width],dtype=numpy.uint8)
				if rows_to_add%2 == 0 : 
					concatenating_array_bottom = concatenating_array_top
				else :
					concatenating_array_bottom = numpy.zeros([int(rows_to_add/2)+1,image_width],dtype=numpy.uint8)
				image = vertical_stack(concatenating_array_top,image)
				image = vertical_stack(image,concatenating_array_bottom)

				return image

			# @debug()
			def add_columns(image,image_width,image_height) : 
				columns_to_add = image_height - image_width
				concatenating_array_left = numpy.zeros([image_height,int(columns_to_add/2)],dtype=numpy.uint8)
				if columns_to_add%2 == 0 : 
					concatenating_array_right = concatenating_array_left
				else : 
					concatenating_array_right = numpy.zeros([image_height,int(columns_to_add/2)+1],dtype=numpy.uint8)
				image = horizontal_stack(concatenating_array_left,image)
				image = horizontal_stack(image,concatenating_array_right)

				return image

			image_width = image.shape[1]
			image_height = image.shape[0]
			if image_width > image_height : 
				image = add_rows(image,image_width,image_height)
			elif image_width < image_height : 
				image = add_columns(image,image_width,image_height)
				# print(image.shape)
			else : 
				#already square
				pass

			return image

		return make_square(image)

	count = 0	#
	total_count = 0	#
	for character in range(1,63) :
		image_number = 1
		while True :
			total_count += 1	#
			folder_name = generate_integer_string(character,3)
			image_name = generate_integer_string(image_number,5)

			image_path = generate_path([DATASET_DIRECTORY,'GoodImg','Bmp','Sample'+folder_name])+'img' + folder_name + '-' + image_name + '.png'
			mask_path = generate_path([DATASET_DIRECTORY,'GoodImg','Msk','Sample'+folder_name])+'img' + folder_name + '-' + image_name + '.png'
			image = cv2.imread(image_path)
			mask = cv2.imread(mask_path)
			if image == None :
				break
			else :
				print('{0}/{1}'.format('Sample'+folder_name,image_name))
				image = reshape(rgb_to_bnw(image,mask))
				mask = reshape(rgb_to_bnw(mask))
				if image.shape[0] < 28 or image.shape[1] < 28 :
					count += 1	#
				cv2.imshow('',numpy.concatenate((image,mask),axis=1))
				# time.sleep(1)
			print('{0}/{1} --> {2}'.format(count,total_count,image.shape))
			image_number += 1



open_images()
# def rgb_to_bnw(image) : 
# 	return_image = numpy.zeros(image.shape[:-1],dtype=numpy.uint8)
# 	for i in range(len(image)) : 
# 		for j in range(len(image[i])) :
# 			# print(image[i][j])
# 			# print(sum(image[i][j]))
# 			return_image[i][j] = sum(image[i][j])/3.0
# 	return return_image
# image_path = '/Users/ironstein/Documents/projects_working_directory/handwriting_recognition/neural_networks/ironstein_codes/data/chars_74K_dataset//GoodImg/Bmp/Sample001/img001-00001.png'
# image = rgb_to_bnw(cv2.imread(image_path))
# print(image)
# cv2.imshow('',image)
# print(type(image))