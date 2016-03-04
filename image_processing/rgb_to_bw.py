import cv2
import numpy as np
import time

##image = cv2.imread('/users/ironstein/desktop/crying_baby.jpg')
##cv2.imshow('im',image)
##image = cv2.imread('/users/ironstein/desktop/crying_baby.jpg',0)
##
##new_image = []
##for element in image:
##    new_image.append([])
##    for pixel in element :
##        #print(int(pixel))
##        #print(np.uint8(pixel))
##        #print('-------')
##        if int(pixel) > 127 :
##            new_image[-1].append(np.uint8(int(255)))
##        else :
##            new_image[-1].append(np.uint8(0))
##print(len(new_image))
##
##new_image = np.array(new_image)
##
##cv2.imshow('image',new_image)        
##cv2.waitKey(0)
##cv2.destroyAllWindows()

def bnw_video() :
    cap = cv2.VideoCapture(0)
    cap.set(3,320)
    cap.set(4,240)
    while(True) :
        ret,frame = cap.read(0)
        #start_time = time.time()
        frame = color_to_bnw(frame)
        bnw_image = []
        for element in frame :
            bnw_image.append([])
            for pixel in element :
                [r,g,b] = pixel
                val = (int(r)+int(g)+int(b))/3
                if val > 127 :
                    bnw_image[-1].append(np.uint8(255))
                else :
                    bnw_image[-1].append(np.uint8(0))
        bnw_image = np.array(bnw_image)
        #print(len(frame))
        #print(len(frame[0]))
        #print(time.time() - start_time)
        cv2.imshow('frame',bnw_image)
    cap.release()

def color_to_bnw(color_image) :
    #start_time = time.time()
    bnw_image = []
    for element in color_image :
        bnw_image.append([])
        for pixel in element :
            [r,g,b] = pixel
            val = (int(r)+int(g)+int(b))/3
            if int(val) > 127 :
                bnw_image[-1].append(np.uint8(255))
            else :
                bnw_image[-1].append(np.uint8(0))
    bnw_image = np.array(bnw_image)
    #print(time.time() - start_time)
    return bnw_image

def rgb_to_greyscale(color_image) :
    greyscale_image = []
    for row in color_image :
        greyscale_image.append([])
        for pixel in row :
            [r,g,b] = pixel
            value = np.uint8((int(r)+int(g)+int(b))/3)
            greyscale_image[-1].append(value)
    return np.array(greyscale_image)

##cap = cv2.VideoCapture(0)
##ret,frame = cap.read(0)
##cap.release()
###cv2.imshow('frame',frame)
##print(frame)
##print(type(frame))
##frame = color_to_bnw(frame)
##print(frame)
##print(type(frame))
##cv2.imshow('frame',frame)

bnw_video()
