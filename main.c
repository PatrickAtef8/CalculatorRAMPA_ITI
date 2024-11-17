#include <stdio.h>
#include <stdint.h>

int32_t Divide(int32_t Dividend, int32_t Divisor);

int main(void)
{
    int32_t x = 0, y = 0;
    int32_t Res = 0;

    printf("Enter two numbers: ");
    scanf("%d %d", &x, &y);

    Res = Divide(x, y);
    printf("%d / %d = %d\n", x, y, Res);

    return 0;
}

int32_t Divide(int32_t Dividend, int32_t Divisor)
{
    if (Divisor == 0)
    {
        return INT32_MIN;
    }
    return (Dividend / Divisor);
}
