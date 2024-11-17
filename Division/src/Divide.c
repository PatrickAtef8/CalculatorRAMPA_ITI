#include "Divide.h"

int32_t Divide(int32_t Dividend, int32_t Divisor)
{
    if (Divisor == 0)
    {
        return INT32_MIN;
    }
    return (Dividend / Divisor);
}
