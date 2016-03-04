import cv2
import numpy
import time
from debug import debug

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

@debug()
def reshape(image) :
	#asssumes a black and white image as input (will not work with RGB image) 
	@debug()
	def make_square(image) : 
		
		@debug()
		def horizontal_stack(array_1,array_2) :
			if array_1.shape[0] != array_2.shape[0] :
				raise ValueError('both arrays should be of same heights') 
			return_array = numpy.zeros([array_2.shape[0],array_1.shape[1] + array_2.shape[1]],dtype=numpy.uint8)
			print(array_1.shape)
			print(array_2.shape)
			print(return_array.shape)
			
			row_count = 0
			for row1,row2 in zip(array_1,array_2) :
				# print(numpy.append(row1,row2).shape) 
				return_array[row_count] = numpy.append(row1,row2)
				row_count += 1
			return return_array

		@debug()
		def vertical_stack(array1,array2) : 
			if array_1.shape[1] != array_2.shape[1] : 
				raise ValueError('both arrays should be of same widths')
			return_array = numpy.zeros([array_2.shape[1],array_1.shape[0] + array_2.shape[0]],dtype=numpy.uint8)
			print(array_1.shape)
			print(array_2.shape)
			print(return_array.shape)
			row_count = 0
			for row1 in array1 : 
				return_array[row_count] = row1
				row_count += 1
			for row2 in array2 : 
				return_array[row_count] = row2
				row_count += 1
			return return_array

		@debug()
		def add_rows(image,image_width,image_height) : 
			rows_to_add = image_width - image_height
			concatenating_array_top = numpy.zeros([int(rows_to_add/2),image_width],dtype=numpy.uint8)
			if rows_to_add%2 == 0 : 
				concatenating_array_bottom = concatenating_array_top
			else :
				concatenating_array_bottom = numpy.zeros([int(rows_to_add/2)+1,image_width],dtype=numpy.uint8)
			numpy.vstack((concatenating_array_top,image))
			numpy.vstack((image,concatenating_array_bottom))

			return image

		@debug()
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
			print(image.shape)
		else : 
			#already square
			pass

		print(image.shape)
		return image

	return make_square(image)

image_path = '/Users/ironstein/Documents/projects_working_directory/handwriting_recognition/neural_networks/ironstein_codes/data/chars_74K_dataset//GoodImg/Bmp/Sample001/img001-00017.png'
image = rgb_to_bnw(cv2.imread(image_path))
print(image)
cv2.imshow('',image)
time.sleep(5)
image = reshape(image)
print(image.shape)
cv2.imshow('hmm',image)
print(type(image))