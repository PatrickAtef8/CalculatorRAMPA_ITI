#include <stdint.h>
#include<stdio.h>
#include "ModulusFeature.h"


int32_t Modulus(int32_t x, int32_t y)
{ 

int32_t result=0;

if (y==0)
{
  printf("dividing by zero is not allowed -__-\n");
  return 0;
}

else
{
    result=x%y;
    return result;
}
}