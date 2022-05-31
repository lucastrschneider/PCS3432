#include <stdio.h>

extern char* int2str(int N, char* s);

void impstr(char *pont) {
    __asm__( 
        "inic_imprime: nop\n\t"
    );

    if (pont[0] != 0) {
          printf("%c\n", pont[0]);
          impstr(pont+1);
    }
    __asm__( 
        "fim_imprime: nop\n\t"
    );

    return;
}

int main() {
    int nusp = 11260850;
    char nusp_str[50];

    __asm__( 
        "pronto: nop\n\t"
    );

    int2str(nusp % 1000, nusp_str);
    
    impstr(nusp_str);

    __asm__( 
        "fim: nop\n\t"
    );

    return 0;
}
