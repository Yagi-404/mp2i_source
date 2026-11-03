#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct Personnage
{
    char nom[80];
    int pv;
    int atq;
    int def;
};

typedef struct Personnage personnage;

void print_stat(personnage* p)
{
    printf("Le personnage s'appelle : %s.\n", p->nom);
    printf("%s a %d points de vie.\n", p->nom, p->pv);
    printf("%s a %d points d'attaque et %d points de defense.\n", p->nom, p->atq, p->def);
}

bool attaque(personnage* p1, personnage* p2)
{
    int pre_pv = p1->pv;

    

    return true;
}

int main(void)
{
    personnage perso1 = {
        .nom="Victor",
        .pv=100,
        .atq=20,
        .def=15
    };

    personnage perso2 = {
        .nom="Ewen",
        .pv=75,
        .atq=25,
        .def=25
    };

    

    return 0;
}