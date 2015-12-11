#import <math.h>
#include <stdio.h>

void convolution(int *array, int length) {
    int i;
    for(i=0;i<length;i++){
         *(array+i) += 1;
    }
}