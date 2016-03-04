from PIL import Image

class image_processing() :

    def __init__(self) :
        self.mean_filter_kernel = [9,[[1,1,1],[1,1,1],[1,1,1]]]
        self.gaussian_smoothing_kernel = [273,[[1,4,7,4,1],[4,16,26,16,4],[7,26,41,26,7],\
                                               [4,16,26,16,4],[1,4,7,4,1]]]
        #self.gaussian_smoothing_kernel = [273,[[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]]
        self.edge_detection_kernel = [1,[[-1,-1,-1],\
                                                       [-1, 8,-1],\
                                                       [-1,-1, -1]]]
        self.vertical_edge_detection_kernel = [1,[[-1,0,1],[-1,0,1],[-1,0,1]]]
        self.horizontal_edge_detection_kernel = [1,[[1,1,1],[0,0,0],[-1,-1,-1]]]

    def mean_filter(self,image) :
        return self.convolution(image,self.mean_filter_kernel[1],self.mean_filter_kernel[0])

    def gaussian_filter(self,image) :
        smoothened_image = self.convolution(image,self.gaussian_smoothing_kernel[1],self.gaussian_smoothing_kernel[0])
        return smoothened_image

    def edge_detection(self,image) :
        edge_detected_image = self.convolution(image,self.edge_detection_kernel[1])
        return edge_detected_image

    def smoothened_edge_detection(self,image) :
        smoothened_image = self.gaussian_filter(image)
        smoothened_edge_detection_image = self.edge_detection(smoothened_image)
        return_image = []
        for row in smoothened_edge_detection_image :
            return_image.append([])
            for pixel in row :
                if(pixel < 50 or pixel > 200) :
                    return_image[-1].append(np.uint8(255))
                else :
                    return_image[-1].append(np.uint8(0))
        return np.array(return_image)

    def vertical_edge_detection(self,image) :
        smoothened_edge_detection_image = self.convolution(self.gaussian_filter(image),self.vertical_edge_detection_kernel[1])
        return_image = []
        for row in smoothened_edge_detection_image :
            return_image.append([])
            for pixel in row :
                if(pixel < 50 or pixel > 200) :
                    return_image[-1].append(np.uint8(255))
                else :
                    return_image[-1].append(np.uint8(0))
        return np.array(return_image)

    def horizontal_edge_detection(self,image) :
        smoothened_edge_detection_image = self.convolution(self.gaussian_filter(image),self.horizontal_edge_detection_kernel[1])
        return_image = []
        for row in smoothened_edge_detection_image :
            return_image.append([])
            for pixel in row :
                if(pixel < 50 or pixel > 200) :
                    return_image[-1].append(np.uint8(255))
                else :
                    return_image[-1].append(np.uint8(0))
        return np.array(return_image)

    def combined_horizontal_and_vertical(self,image) :
        return_image  = []
        for row_vertical,row_horizontal in zip(self.vertical_edge_detection(image),self.horizontal_edge_detection(image)) :
            return_image.append([])
            for pixel_vertical,pixel_horizontal in zip(row_vertical,row_horizontal) :
                if(pixel_vertical < 50 or pixel_horizontal < 50) :
                    return_image[-1].append(np.uint8(0))
                else :
                    return_image[-1].append(np.uint8(255))
        return np.array(return_image)


    def convolution(self,image,kernel,scaling_factor = 1) :

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
            return np.uint8(return_value/scaling_factor)

        for row in range(image_height - kernel_height + 1) :
            return_image.append([])
            for pixel in range(image_width - kernel_width + 1) :
                image_slice = [[image[i,j] for j in range(pixel,pixel + kernel_width)] for i in range(row,row + kernel_height)]
                #print(image_slice)
                return_image[-1].append(element_wise_matrix_multiplication(image_slice,kernel,scaling_factor))
        return np.array(return_image)


impr = image_processing()
image = cv2.imread('sample_image.jpeg',0)
cv2.imshow('image',image)
smoothened_edge_detection = impr.smoothened_edge_detection(image)
im = Image.fromarray(smoothened_edge_detection)
im.save('/Users/ironstein/Documents/projects working directory/handwriting recognition using \
neural networks on FPGA final year project/image processing/processed images/smoothened_image.bmp')
#cv2.imshow('smoothened_edge_detection',smoothened_edge_detection)
#cv2.imshow('vertical_edge_detection',impr.vertical_edge_detection(image))
#cv2.imshow('horizontal_edge_detection',impr.horizontal_edge_detection(image))
cv2.imshow('combined_horizontal_and_vertical',impr.combined_horizontal_and_vertical(image))
cv2.waitKey(0)
cv2.destroyAllWindows()
