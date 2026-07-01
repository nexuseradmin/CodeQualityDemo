#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "bugs.h"

void memory_leak(){
    char *p=malloc(100);
    strcpy(p,"Leak");
    printf("%s\n",p);
}

void null_pointer(){
    int *p=NULL;
    *p=10;
}

void unused_variable(){
    int x=100;
}
