import cv2
import numpy as np
import time

class bnw_video() :

    def __init__(self) :
        
        self.cap = cv2.VideoCapture(0)
        self.cap.set(3,320)
        self.cap.set(4,240)
        self.start_video()

    def start_video(self) :

        while(True) :
            ret,frame = self.cap.read(0)
            cv2.imshow('frame',self.color_to_bnw(frame))
            cv2.waitKey(10)

    def color_to_bnw(self,color_image) :
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

bnw_video()
