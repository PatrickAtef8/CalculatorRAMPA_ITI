#include <stdio.h>
#include <stdint.h>

#include "sum.h"
#include "subtraction.h"
#include "multiplication.h"
#include "Divide.h"
#include "ModulusFeature.h"

int main(void)
{
    int32_t x = 0, y = 0;
    int32_t Res = 0;

    printf("Enter two numbers: ");
    scanf("%d %d", &x, &y);

    Res = Modulus(x, y);
    printf("Modulus Result:%d\n", Res);

    Res = multi(x, y);
    printf("Multiplication Result:%d\n", Res);

    Res = Divide(x, y);
    printf("%d / %d = %d\n", x, y, Res);

    Res = sum(x, y);
    printf("SUM = %d\n", Res);

    Res = subtraction(x, y);
    printf("Subtraction Result: %d\n", Res);

    return 0;
}
