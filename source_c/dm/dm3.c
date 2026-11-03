#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//* Exercices

// Exercice 20

int nbindnb(int* tab, int taille)
{
    int rep = 0;
    int occ = 0;

    for(int i = 0; i < taille; i++)
    {
        // compte les occurences
        occ = 0;

        // <- le compteur d'occurences revient à 0 pour le i-ème élément étudié
        for(int j = 0; j < taille; j++)
        {
            if(tab[i]==tab[j])
            {
                occ+=1;
            }
        }
        // <-> occ vaut le nbr d'occurences du i-ème élément
        // <- rep vaut le nbr de fois où occ valait l'indice
        if(occ == i)
            rep+=1;

        // -> rep conditionnellement incrémenté jusqu'au i-ème élément étudié
    }

    return rep;
}

// Exercice 21

int nbnbnb(int* tab, int t)
{
    int rep;
    int occ;

    for(int i = 0; i < t; i++)
    {
        occ = 0;
        
        for(int j = 0; j < t; j++)
        {
            if(tab[i]==tab[j])
                occ+=1;
        }

        if(tab[i] >= occ)
            rep+=1;
    }
    
    return rep;
}

// Exercice 22

int nbsomindnb(int* tab, int t)
{
    int rep;
    int sum;

    for(int i = 0; i < t; i++)
    {
        if(tab[i] < 0) continue; // on ne traite pas les nombres négatifs

        sum = 0;
        for(int j = 0; j < t; j++)
        {
            // occurence
            if(tab[i]==tab[j])
                sum+=j;
        }
        // -> sum : somme des indices auxquels il y a une occurence de tab[i]

        if(tab[i] == sum)
            rep+=1;
    }

    return rep;
}

// Exercice 23

int prodind(int* tab, int t, int n)
{
    int prod = 1;

    for(int i = 0; i < t; i++)
    {
        if(tab[i] == n)
            prod*=i;
    }

    return prod;
}

// Excercice 24

char* cycle(char* string, int n)
{
    int   len = strlen(string);
    char* rep = malloc(sizeof(char) * (len+1));

    // fin
    for(int i = n; string[i] != '\0'; i++)
        rep[i - n] = string[i];

    // debut
    for(int i = 0; i < n; i++)
        rep[len - n + i] = string[i];

    return rep;
}

// Exercice 25

char** cycles(char* str)
{
    int len = strlen(str);
    char** strs = malloc(sizeof(char*) * (len));

    for(int i = 0; str[i] != '\0'; i++)
        strs[i] = cycle(str, i);

    return strs;
}

// Exercice 26

char* cyclemin(char* str)
{
    int len = strlen(str);
    char** strs = cycles(str);
    char* strmin = strs[0];

    // parcours strs
    for(int i = 1; i < len; i++)
    {
        if(strcmp(strmin, strs[i]) > 0)
            strmin = strs[i];
    }

    return strmin;
}

// Exercice 27

void trichaine(char* str)
{
    for(int i = 0; str[i] != '\0'; i++)
    {
        for(int j = i+1; str[j] != '\0'; j++)
        {
            if(str[j] < str[i])
            {
                char tp = str[i];
                str[i] = str[j];
                str[j] = tp;
            }
        }
    }
}

int val(char c)
{
    switch (c)
    {
    case 'M':
        return 1000;
    case 'D':
        return 500;
    case 'C':
        return 100;
    case 'L':
        return 50;
    case 'X':
        return 10;
    case 'V':
        return 5;
    case 'I':
        return 1;
    default:
        return 0;
    }
}

int tibere(char* str)
{
    int rep, i;

    for(i = 0; str[i] != '\0'; i++)
    {
        if(str[i+1] == '\0') break;

        if(val(str[i+1]) > val(str[i]))
        {
            rep = rep - val(str[i]);
        } else {
            rep = rep + val(str[i]);
        }
    }
    
    rep += val(str[i]);

    return rep;
}

char* compressromain(char* str)
{
    
}

//* Main des exos

int main20()
{
    int tab[] = {1, 0, 2, 3};
    int s = 4;

    printf("nbindnb : %d", nbindnb(tab, s));
    return 0;
}

int main21()
{
    int tab[] = {0, 1, 2, 2};
    int t = 4;

    printf("nbnbnb : %d\n", nbnbnb(tab, t));
    return 0;
}

int main22()
{
    int tab[] = {0, 1};

    /*
    1 occ de 0 dans tab ; sum = 0
    sum == tab[0]
    
    1 occ de 1 dans tab; sum = 1
    sum == tab[1]

    retourne 2
    */

    int t = 2;

    printf("nbsomindnb : %d\n", nbsomindnb(tab, t));
    return 0;
}

int main23()
{
    int n = 1;
    int tab[] = {0, 1, 1, 1}; // retourne 6
    int t = 4;

    printf("prodind : %d\n", prodind(tab, t, n));
    return 0;
}

int main24()
{
    int n = 3;
    char* string = "Exemple";

    printf("cycle : %s\n", cycle(string, n));
    return 0;
}

int main25()
{
    char* str   = "Exemple";
    char** strs = cycles(str);

    printf("cycles : ");
    for(int i = 0; i < 7; i++)
        printf("%s\n", strs[i]);
    return 0;
}

int main26()
{
    char* str = "ABBA"; // renvoie AABB
    printf("cyclemin : %s\n", cyclemin(str));

    return 0;
}

int main27()
{
    char str[] = "DCBA";
    trichaine(str);
    printf("trichaine : %s\n", str);

    return 0;
}

int main28()
{
    char str[] = "XXIV";

    printf("tibere : %d\n", tibere(str));

    return 0;
}

int main29()
{
    return 0;
}

//* Main final

int main(void)
{
    // int zero = main20();
    // zero = main21();
    // zero = main22();
    // zero = main23();
    // zero = main24();
    // zero = main25();
    // zero = main26();
    // zero = main27();
    // zero = main28();
    // zero = main29();

    // main20();
    // main21();
    // main22();
    // main23();
    // main24();
    // main25();
    // main26();
    // main27();
    // main28();
    main29();

    return 0;
}
