#include <stdio.h>

void imprime(int n) {
    if (n < 0) {
        return;
}
    printf("numero = %d\n", n);
    imprime(n - 1);
}

int main() {
    imprime(5);
}
