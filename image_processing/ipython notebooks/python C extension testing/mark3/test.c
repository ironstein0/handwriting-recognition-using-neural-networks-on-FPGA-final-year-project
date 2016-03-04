
#include <stdio.h>

void for_loop_test_without_register_values(int n) {
    int i;
    int j;
    for(i=0;i<n;i++);
}

void for_loop_test_with_register_values(int n) {
    
    int var = n;
    int i;
    int p;     
    
    for(i=0;i<var;i++){
        for(p=0;p<10000;p++);
    }
}