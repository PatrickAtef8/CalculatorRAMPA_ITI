#include <stdio.h>
#include <stdint.h>


int32_t sum(int32_t num1,int32_t num2);

int main(void)
{
    int32_t x = 0, y = 0;
    int32_t Res = 0;


    printf("Enter two numbers: ");
    scanf("%d %d", &x, &y);
	
    Res = sum(x,y);
    printf("SUM = %d\n",Res);
    

    return 0;
}

int32_t sum(int32_t num1,int32_t num2)
{
    return num1 + num2;
}

