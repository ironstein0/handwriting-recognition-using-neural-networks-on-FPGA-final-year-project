
#include<stdlib.h>
#include<math.h>

/*------------------------------------------------------------------------
------------------------------ DECLARATIONS ------------------------------
------------------------------------------------------------------------*/

//Macro for calculating the maximum value of a number
#define absolute(number) ((number^(number>>31)) + ((number>>31)&1))
void convolution(int *image,int *return_image,int *kernel,int image_width, int image_height, int kernel_size, int kernel_normalizer);
void sobel_operator(int *image,int *magnitude,int *angle,int image_width,int image_height);
int quantize(double number);

/*------------------------------------------------------------------------
------------------------------ CONVOLUTION -------------------------------
------------------------------------------------------------------------*/


void convolution(int *image,int *return_image,int *kernel,int image_width, int image_height, int kernel_size, int kernel_normalizer) {
    
    int border_width = (kernel_size-1)/2;
    int image_starting_x = 0;
    int image_starting_y = 0;
    int image_ending_x = image_width - kernel_size + 1;
    int image_ending_y = image_height - kernel_size + 1;
    
    int i,j,u,v;
    int sum;

    for(i=image_starting_y;i<image_ending_y;i++) {
        for(j=image_starting_x;j<image_ending_x;j++) {
            
            //current left top corner pixel is i,j
            sum = 0;
            for(u=0;u<kernel_size;u++) {
                for(v=0;v<kernel_size;v++) {
                    sum += (*(image + image_width*(i+u) + j+v))*(*(kernel + u*kernel_size + v));
                }
            }
            
            /*adding the border_width parameter enebles us to convert 
            to center_pixel based convolution rather that edge pixel 
            based convolution*/
            *(return_image + (image_width*(i+border_width)) + j+border_width) = (sum/kernel_normalizer);
        }
    }
}

/*------------------------------------------------------------------------
---------------------------- SOBEL OPERATOR ------------------------------
------------------------------------------------------------------------*/


void sobel_operator(int *image,int *magnitude,int *angle,int image_width,int image_height) {

    //---------------- IMAGE RELATED VARIABLE DECLARATIONS --------------------
    int border_width = 1;
    int image_starting_x = 0;
    int image_starting_y = 0;
    int image_ending_x = image_width - 2;
    int image_ending_y = image_height - 2;
    //----------------------------------------------------------------------

    //--------------- CONVOLUTION RELATED VARIABLE DECLARATIONS --------------
    int kernel_x[3][3] = {{1,0,-1},{2,0,-2},{1,0,-1}};
    int kernel_y[3][3] = {{1,2,1},{0,0,0},{-1,-2,-1}};
    int i,j,u,v;
    int32_t sum_x,sum_y;
    int kernel_size = 3;
    double val = 180/3.14;
    //------------------------------------------------------------------------

    for(i=image_starting_y;i<image_ending_y;i++) {
        for(j=image_starting_x;j<image_ending_x;j++) {
            
            //current left top corner pixel is i,j
            sum_x = 0;
            sum_y = 0;
            for(u=0;u<3;u++) {
                for(v=0;v<3;v++) {
                    sum_x += (*(image + image_width*(i+u) + j+v))*kernel_x[u][v];
                    sum_y += (*(image + image_width*(i+u) + j+v))*kernel_y[u][v];
                }
            }
            
            /*adding the border_width parameter enebles us to convert 
            to center_pixel based convolution rather that edge pixel 
            based convolution*/
            *(magnitude + (image_width*(i+border_width)) + j+border_width) =   (absolute(sum_x) + absolute(sum_y));
            *(angle + (image_width*(i+border_width)) + j+border_width) = 
                quantize(atan2(sum_y,sum_x)*val);
        }
    }

}

int quantize(double number) {

    //all upper and lower limits will be rounded up
    int zero_l1[2] = {-22,22};
    int zero_l2[2] = {-180,-158};
    int zero_l3[2] = {158,180};
    int fortyfive_l1[2] = {23,67};
    int fortyfive_l2[2] = {-157,-113};
    int ninety_l1[2] = {68,112};
    int ninety_l2[2] = {-112,-68};

    if(((number > zero_l1[0])&&(number < zero_l1[1]))||
       ((number > zero_l2[0])&&(number < zero_l2[1]))||
       ((number > zero_l3[0]))) {
                return 0;
    }
    else if(((number > fortyfive_l1[0])&&(number < fortyfive_l1[1]))||
            ((number > fortyfive_l2[0])&&(number < fortyfive_l2[1]))) {
                return 135;
    }

    else if(((number > ninety_l1[0])&&(number < ninety_l1[1]))||
            ((number > ninety_l2[0])&&(number < ninety_l2[1]))) {
                return 90;
    }

    else {
                return 45;
    }
}