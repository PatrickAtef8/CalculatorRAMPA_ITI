#include "Divide.h"
#include "Configuration.h"

#ifdef DIV

int32_t Divide(int32_t Dividend, int32_t Divisor)
{
    if (Divisor == 0)
    {
        return INT32_MIN;
    }
    return (Dividend / Divisor);
}

#endif /* DIV */
