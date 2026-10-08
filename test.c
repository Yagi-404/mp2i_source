#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char* str = "abc123";
    
    int a;

    if(sscanf(str, "%d", &a) == 1) 
        printf("\nSortie : %d", a);

    return 0;
}

int nb1(int x)
{
    int rep = 0;

    while(x > 0)
    {
        if((x % 2) == 1) rep+=1;
        x = x/2;
    }

    return rep;
}