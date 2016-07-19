import numpy
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

def display_image(image) : 
    plt.imshow(image,cmap=plt.get_cmap('gray'))