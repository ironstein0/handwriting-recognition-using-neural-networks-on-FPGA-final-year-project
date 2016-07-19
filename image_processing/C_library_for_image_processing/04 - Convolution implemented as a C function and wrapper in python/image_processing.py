import numpy

class image_processing() : 
    
    def __init__(self) : 
        pass
    
    def convolution(self,image,kernel) : 
        
        scaling_factor = kernel[0]
        kernel = kernel[1]
        image_width = len(image[0])
        image_height = len(image)
        kernel_width = len(kernel[0])
        kernel_height = len(kernel)

        return_image = []

        def element_wise_matrix_multiplication(matrix1,matrix2,scaling_factor=1) :
            return_value = 0
            for m1_row,m2_row in zip(matrix1,matrix2) :
                for m1_pixel,m2_pixel in zip(m1_row,m2_row) :
                    return_value += int(m1_pixel)*int(m2_pixel)
            return numpy.uint8(return_value/scaling_factor)
                
        for row in range(image_height - kernel_height + 1) :
            return_image.append([])
            for pixel in range(image_width - kernel_width + 1) :
                image_slice = [[image[i,j] for j in range(pixel,pixel + kernel_width)]\
                               for i in range(row,row + kernel_height)]
                #print(image_slice)
                return_image[-1].append(element_wise_matrix_multiplication(image_slice,kernel,scaling_factor))
        return numpy.array(return_image)
    
    def rgb_to_grayscale(self,image) : 
        return_image = []
        for row in image : 
            return_image.append([])
            for pixel in row : 
                try : 
                    [r,g,b,s] = pixel
                except ValueError : 
                    [r,g,b] = pixel
                return_image[-1].append(numpy.uint8((int(r)+int(g)+int(b))/3))
        return numpy.array(return_image)
    
    def add_images(self,image1,image2) :
        return_array = []
        for row1,row2 in zip(image1,image2) : 
            return_array.append([])
            for pixel1,pixel2 in zip(row1,row2) :
                return_array[-1].append(numpy.uint8((int(pixel1))|(int(pixel2))))
        return numpy.array(return_array)