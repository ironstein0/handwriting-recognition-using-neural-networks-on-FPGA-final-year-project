import numpy
import matplotlib.pyplot as plt
import locate_file

working_directory = locate_file.locate_file()

def read_image(image_name,bnw_flag = False,threshold=127,invert=False) : 
    
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
                value = numpy.uint8((int(r)+int(g)+int(b))/3)
                if(bnw_flag == True) : 
                    if(value > threshold) : 
                        if(invert == False) : 
                            value = 255
                        else : 
                            value = 0
                    else : 
                        if(invert == False) : 
                            value = 0
                        else : 
                            value = 255

                return_image[-1].append(value)
        return numpy.array(return_image)
    
    harmless_image = convert_to_harmless_image(plt.imread(working_directory + image_name))
    return(rgb_to_grayscale(harmless_image))

def display_image(image,bnw=False,threshold=127,invert=False) :
    if bnw == False : 
        plt.imshow(image,cmap=plt.get_cmap('gray'))
    else : 
        displayed_image = []
        for row in image :
            displayed_image.append([]) 
            for pixel in row : 
                if invert == False : 
                    if pixel > threshold : 
                        displayed_image[-1].append(255)
                    else : 
                        displayed_image[-1].append(0)
                else : 
                    if pixel > threshold : 
                        displayed_image[-1].append(0)
                    else : 
                        displayed_image[-1].append(255)
        plt.imshow(displayed_image,cmap=plt.get_cmap('gray'))

def grayscale_to_bnw(image,threshold=127,invert=False) :
    return_image = [] 
    for i in range(len(image)) : 
        return_image.append([])
        for j in range(len(image[0])) : 
            if image[i][j] > threshold : 
                if invert == False : 
                    return_image[-1].append(255)
                else : 
                    return_image[-1].append(0)
            else : 
                if invert == False : 
                    return_image[-1].append(0)
                else : 
                    return_image[-1].append(255)
    return return_image