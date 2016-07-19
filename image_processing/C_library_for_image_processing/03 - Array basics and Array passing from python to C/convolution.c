#import <math.h>
#include <stdio.h>

void convolution(int *array, int rows, int columns) {
    int i,j;
    int return_array[rows][columns];
    for(i=0;i<rows;i++){ 
        for(j=0;j<columns;j++) {
            *(array+(i*columns)+j) = 255 - *(array+(i*columns)+j);
        }
    }
}