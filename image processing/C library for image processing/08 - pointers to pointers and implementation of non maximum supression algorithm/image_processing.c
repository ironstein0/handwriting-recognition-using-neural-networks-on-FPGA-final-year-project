
#include<stdlib.h>
#include<math.h>
#include<stdio.h>

/*------------------------------------------------------------------------
------------------------------ DECLARATIONS ------------------------------
------------------------------------------------------------------------*/

//Macro for calculating the maximum value of a number
#define absolute(number) ((number^(number>>31)) + ((number>>31)&1))
void convolution(int *image,int *return_image,int *kernel,int image_width, int image_height, int kernel_size, int kernel_normalizer);
void sobel_operator(int *image,int *magnitude,int *angle,int image_width,int image_height);
int quantize(double number);
void non_maximum_supression(int *magnitude,int *angle,int *return_image,int image_width,int image_height);
void element_wise_matrix_multiplication(int *matrix1,int *matrix2,int *return_matrix,int length);
int max_element_from_matrix(int *matrix,int size);
void print_matrix(int *matrix,int size);

/*------------------------------------------------------------------------
------------------------------ CONVOLUTION -------------------------------
------------------------------------------------------------------------*/


void convolution(int *image,int *return_image,int *kernel,int image_width, int image_height, int kernel_size, int kernel_normalizer) {
    
    /*----------------------- SIZES OF INPUT ARRAYS ---------------------
    imag --> numpy.int32
    return_image --> numpy.int32
    kernel --> numpy.int32
    image_width --> int32
    image_height --> int32
    kernel_size --> int32
    kernel_normalizer --> int32
    --------------------------------------------------------------------*/

    //------------------- IMAGE RELATED DECLARATIONS ---------------------
    int border_width = (kernel_size-1)/2;
    int image_starting_x = 0;
    int image_starting_y = 0;
    int image_ending_x = image_width - kernel_size + 1;
    int image_ending_y = image_height - kernel_size + 1;
    //--------------------------------------------------------------------

    //------------------ CONVOLUTION RELATED DECLARATIONS ----------------
    int i,j,u,v;
    int sum;
    //--------------------------------------------------------------------
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

    /*----------------------- SIZES OF INPUT ARRAYS ---------------------
    image --> numpy.int32
    magnitude --> numpy.int32
    angle --> numpy.uint8
    image_width --> int32
    image_height --> int32
    --------------------------------------------------------------------*/

    //---------------- IMAGE RELATED VARIABLE DECLARATIONS --------------------
    int kernel_size = 3;
    int border_width = (kernel_size-1)/2;
    int image_starting_x = 0;
    int image_starting_y = 0;
    int image_ending_x = image_width - kernel_size + 1;
    int image_ending_y = image_height - kernel_size + 1;
    //----------------------------------------------------------------------

    //--------------- CONVOLUTION RELATED VARIABLE DECLARATIONS --------------
    int kernel_x[3][3] = {{1,0,-1},{2,0,-2},{1,0,-1}};
    int kernel_y[3][3] = {{1,2,1},{0,0,0},{-1,-2,-1}};
    int i,j,u,v;
    int32_t sum_x,sum_y;
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
            *(magnitude + (image_width*(i+border_width)) + j+border_width) =   (absolute(sum_x) + absolute(sum_y))/4;
            *(angle + (image_width*(i+border_width)) + j+border_width) = 
                quantize((atan2(sum_y,sum_x))*val);
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
                return 45;
    }

    else if(((number > ninety_l1[0])&&(number < ninety_l1[1]))||
            ((number > ninety_l2[0])&&(number < ninety_l2[1]))) {
                return 90;
    }

    else {
                return 135;
    }
}

/*------------------------------------------------------------------------
------------------------- NON MAXIMUM SUPRESSION -------------------------
------------------------------------------------------------------------*/

void non_maximum_supression(int *magnitude,int *angle,int *return_image,int image_width,int image_height) {

    /*----------------------- SIZES OF INPUT ARRAYS ---------------------
    magnitude --> numpy.int32
    angle --> numpy.uint8
    return_image --> numpy.uint8
    image_width --> int32
    image_height --> int32
    --------------------------------------------------------------------*/

    //--------------------- IMAGE RELATED DECLARATIONS -------------------
    int kernel_size = 3;
    int center_indentation = (kernel_size-1)/2;
    int border_width = (kernel_size-1)/2;
    int image_starting_x = 0;
    int image_starting_y = 0;
    int image_ending_x = image_width - kernel_size + 1;
    int image_ending_y = image_height - kernel_size + 1;
    //--------------------------------------------------------------------
    
    //------------------ CONVOLUTION RELATED DECLARATIONS -----------------

    //---------------------- 3x3 matrices---------------------------------

    int north_south[3][3] = {{0,1,0},
                             {0,1,0},
                             {0,1,0}};

    int east_west[3][3] =   {{0,0,0},
                             {1,1,1},
                             {0,0,0}};

    int south_east_north_west[3][3] = {{1,0,0},
                                       {0,1,0},
                                       {0,0,1}};

    int south_west_north_east[3][3] = {{0,0,1},
                                       {0,1,0},
                                       {1,0,0}};


    //-------------------------- 5x5 matrices ----------------------------

    // int north_south[5][5] = {{0,0,1,0,0},
    //                          {0,0,1,0,0},
    //                          {0,0,1,0,0},
    //                          {0,0,1,0,0},
    //                          {0,0,1,0,0}};

    // int east_west[5][5] = {{0,0,0,0,0},
    //                        {0,0,0,0,0},
    //                        {1,1,1,1,1},
    //                        {0,0,0,0,0},
    //                        {0,0,0,0,0}};

    // int south_east_north_west[5][5] = {{1,0,0,0,0},
    //                                    {0,1,1,1,0},
    //                                    {0,1,1,1,0},
    //                                    {0,1,1,1,0},
    //                                    {0,0,0,0,1}};

    // int south_west_north_east[5][5] = {{0,0,0,0,1},
    //                                    {0,1,1,1,0},
    //                                    {0,1,1,1,0},
    //                                    {0,1,1,1,0},
    //                                    {1,0,0,0,0}};

    //-------------------------- 7x7 matrices ----------------------------

    // int north_south[7][7] = {{0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0},
    //                          {0,0,1,1,1,0,0}};

    // int east_west[7][7] = {{0,0,0,0,0,0,0},
    //                        {0,0,0,0,0,0,0},
    //                        {1,1,1,1,1,1,1},
    //                        {1,1,1,1,1,1,1},
    //                        {1,1,1,1,1,1,1},
    //                        {0,0,0,0,0,0,0},
    //                        {0,0,0,0,0,0,0}};

    // int south_east_north_west[7][7] = {{1,1,0,0,0,0,0},
    //                                    {1,1,1,0,0,0,0},
    //                                    {0,1,1,1,0,0,0},
    //                                    {0,0,1,1,1,0,0},
    //                                    {0,0,0,1,1,1,0},
    //                                    {0,0,0,0,1,1,1},
    //                                    {0,0,0,0,0,1,1}};

    // int south_west_north_east[7][7] = {{0,0,0,0,0,1,1},
    //                                    {0,0,0,0,1,1,1},
    //                                    {0,0,0,1,1,1,0},
    //                                    {0,0,1,1,1,0,0},
    //                                    {0,1,1,1,0,0,0},
    //                                    {1,1,1,0,0,0,0},
    //                                    {1,1,0,0,0,0,0}};


    int return_matrix[kernel_size][kernel_size];
    //---------------------------------------------------------------------

    //pointer for passing only a part of the matrix
    //will contain the address of the first element of the matrix
    int *pixel_pointer;
    int *kernel_pointer;
    int *return_matrix_pointer;
    int max_value=0;

    int i,j;

    for(i=0;i<image_ending_y;i++) {
        for(j=0;j<image_ending_x;j++) {

            //center pixel is (i+center_indentation,j+center_indentation)

            pixel_pointer = magnitude + (image_width*(i)) + j;
            // kernel_pointer = &south_west_north_east[0][0];
            return_matrix_pointer = &return_matrix[0][0];

            switch(*(angle + (image_width*i) + j)) {
                case 0 : 
                    kernel_pointer = east_west;
                    break;
                case 45 :
                    kernel_pointer = south_east_north_west;
                    break;
                case 90 : 
                    kernel_pointer = north_south;
                    break;
                case 135 : 
                    kernel_pointer = south_west_north_east;
                    break;
            }

            element_wise_matrix_multiplication(pixel_pointer,kernel_pointer,return_matrix_pointer,(kernel_size*kernel_size));

            //saving the value of the center pixel
            int pixel_to_compare = return_matrix[center_indentation]
            [center_indentation];

            //setting the value of the center pixel to 0
            return_matrix[center_indentation][center_indentation] = 0;
            
            max_value = max_element_from_matrix(return_matrix_pointer,
                kernel_size*kernel_size);

            if((max_value >= pixel_to_compare)||(pixel_to_compare == 0)) {
                *(return_image + ((i+center_indentation)*image_width) + (j+center_indentation)) = 0;
            }
            else {
                *(return_image + ((i+center_indentation)*image_width) + (j+center_indentation)) = *(magnitude + ((i+center_indentation)*image_width) + j+center_indentation);
                // *(return_image + ((i+center_indentation)*image_width) + (j+center_indentation)) = 255;
            }
        }
    }

}

void element_wise_matrix_multiplication(int *matrix1,int *matrix2,
    int *return_matrix,int size) {
    int i;

    for(i=0;i<size;i++) {
        *(return_matrix + i) = (*(matrix1 + i))*(*(matrix2 + i));
    }
}

int max_element_from_matrix(int *matrix,int size) {
    int i,max=0;
    for(i=0;i<size;i++) {
        if(*(matrix+i) > max) {
            max = *(matrix+i);
        }
    }
    // printf("%d\n",return_value);
    return(max);
}

void print_matrix(int *matrix,int size) {
    int i,j;
    for(i=0;i<size;i++) {
        for(j=0;j<size;j++) {
            printf("%8d  ",*(matrix + size*i + j));
        }
        printf("\n");
    }
    printf("--------------------------------------------------------------\n");
}


/*------------------------------------------------------------------------
---------------------------- IMAGE THRESHOLDING --------------------------
------------------------------------------------------------------------*/

void threshold(int *image,int threshold,int image_width,int image_height) {
    
    int i,j;
    for(i=0;i<image_height;i++) {
        for(j=0;j<image_width;j++) {
            if(*(image + (image_width*i) + j) > threshold) {
                *(image + (image_width*i) + j) = 255;
            } 
            else {
                *(image + (image_width*i) + j) = 0;
            }
        
        }
    }
}