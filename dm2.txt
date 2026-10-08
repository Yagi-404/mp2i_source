#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include <ctype.h>

// Exo 10

int multarr(double a, double b)
{
    // l'ajout de (int) permet de cast a*b, un double, en entier

    return (int) a * b;
}

int main10(void)
{
    printf("multarr : %d", multarr(1.5, 1.7));

    return 0;
}

// Exo 11

bool moislong(int mois)
{
    if(mois < 1 || mois > 12) return false;                                                // n'est pas un mois 
    if((mois <= 7 && (mois % 2) == 1) || (mois >= 8 && (mois % 2) == 0)) return true;      // est long
    return false;                                                                          // n'est pas long
}

int main11(void)
{
    printf("\nMois long ? %d", moislong(10));

    return 0;
}

// Exo 12

char milieu(char* string)
{
    int size = strlen(string);

    printf("\n%d", size);

    if(size % 2 == 0) 
    {
        // retourne le caractère de gauche
        // -1 pour le décalage d'indice

        return string[(size/2)-1];
    }

    // -1 pour que size soit mult de 2

    return string[(size-1)/2];
}

int main12(void)
{
    printf("\nMilieu : %c", milieu("IKEA"));

    return 0;
}

// Exo 13

int abs(int a)
{
    if(a<0) return -a;
    return a;
}

int ecartabsmax(int* tab, size_t taille)
{
    int min = abs(tab[0]);
    int max = abs(tab[0]);

    for(size_t i = 0; i <= taille - 1; i++)
    {
        if(min > abs(tab[i])) min = abs(tab[i]);
        if(max < abs(tab[i])) max = abs(tab[i]);
    }
    
    // abs : debug -> !necessaire

    return abs(max - min);

}

int main13(void)
{
    int tab[6] = {1,2,3,4,5,6};

    printf("\nEcart max : %d", ecartabsmax(tab, 6));

    return 0;
}

// Exo 14

int extraire(char* str)
{
    int rep;
    int taille = strlen(str);

    if(taille == 0) return 0;
    if(taille >= 10) exit(1);

    if(sscanf(str, "%d", &rep)==1) return rep;

    return -1;
}

int main14(void)
{
    printf("\nExtraire : %d", extraire("abc123"));

    return 0;
}

// Exo 15

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

int main15(void)
{
    printf("\nnb1 : %d", nb1(13));

    return 0;
}

// Exo 16

int prodmin(int* tab1, int* tab2, int taille)
{
    int* tab_prod = malloc(sizeof(int)*taille);

    for(int i = 0; i <= taille-1; i++)
        tab_prod[i] = tab1[i]*tab2[i];

    int prodmin = tab_prod[0];

    for(int i = 0; i <= taille-1; i++)
    {
        if(prodmin >= tab_prod[i])
            prodmin = tab_prod[i];
    }

    return prodmin;
}

int main16(void)
{
    int tab1[3] = {1,2,3};
    int tab2[3] = {2,2,2};

    printf("\nprodmin : %d", prodmin(tab1, tab2, 3));

    return 0;
}

// Exo 17

bool moyent(int* tab, double taille)
{
    double somme;

    for(int i = 0; i < taille; i++)
        somme = somme + tab[i];
    
    double moy = somme / taille;

    if(floor(moy) == moy) // cond entier
        return true;

    return false;
}

int main17(void)
{
    int tab[5] = {3,3,3,3,3};

    printf("\nmoyent : %d", moyent(tab, 5));

    return 0;
}

// Exo 18

int* bezout(int a, int b)
{
    if(a<1 || b<1)
        return ;

    int r = a;
    int r_ = b;
    int u = 1;
    int v = 0;
    int u_ = 0;
    int v_ = 1;

    int q, rs, us, vs;

    while(r_ != 0)
    {
        q = r / r_;
        rs = r;
        us = u;
        vs = v;
        r = r_;
        u = u_;
        v = v_;

        r_ = rs - q*r_;
        u_ = us - q*u_;
        v_ = vs - q*v_;
    }

    int couple[2] = {u,v};

    return couple;
}

int main18(void)
{
    int cpl[2] = bezout(2,3);

    printf("\nbezout : %d %d", cpl[0], cpl[1]);

    return 0;
}

// Exo 19

int base(int b, int input)
{
    // on pourrait s'inspirer de nb1

    return 0;
}

int main19(void)
{
    printf("\nbase : %d", base(2, 10));

    return 0;
}

/// MAIN ///

int main(void)
{
    int zero = main10();
    zero = main11();
    zero = main12();
    zero = main13();
    zero = main14();
    zero = main15();
    zero = main16();
    zero = main17();
    zero = main18();
    zero = main19();
    return zero;
}