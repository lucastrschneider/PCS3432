#include <stdio.h>

extern char* int2str(int N, char* s);

char N_str[50];

void imprime(int N) {
    int lixo;

    lixo++;
    
    if (N < 0) {
        return;
    }

    int2str(N, N_str);
    puts(N_str);

    imprime(N-1);
}

int main(void) {
    imprime(7);

    return 0;
}
