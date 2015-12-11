import libconvolution
import numpy
import matplotlib
import matplotlib.pyplot as plt
import locate_file

working_directory = locate_file.locate_file()

def read_image(image_name) : 
    
    def convert_to_harmless_image(image) : 
        return_image = []
        for row in image :
            return_image.append([])
            for pixel in row : 
                return_image[-1].append(numpy.uint8(pixel*255))
        return return_image
    
    def rgb_to_grayscale(image) : 
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
    
    harmless_image = convert_to_harmless_image(plt.imread(working_directory + image_name))
    return(rgb_to_grayscale(harmless_image))

def display(image) : 
    plt.imshow(image,cmap=matplotlib.pyplot.get_cmap('gray'))

# image = read_image('sample_image_3.png')

# kernel = [1,[[-1,0,1],[-1,0,1],[-1,0,1]]]
# kernel_normalizer = 9

# c_image = libconvolution.convolution(image,kernel[1],1)
# plt.imshow(c_image,cmap=matplotlib.pyplot.get_cmap('gray'))

