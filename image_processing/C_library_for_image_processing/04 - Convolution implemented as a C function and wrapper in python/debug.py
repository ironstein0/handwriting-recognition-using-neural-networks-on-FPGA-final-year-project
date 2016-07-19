
import numpy
import matplotlib.pyplot as plt
import libconvolution

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
    
image = rgb_to_grayscale(plt.imread('sample_image_3.png'))
kernel = [[1,1,1],[1,1,1],[1,1,1]]
kernel_normalizer = 9

print('starting')
libconvolution.convolution(image,kernel,kernel_normalizer)
print('ending')