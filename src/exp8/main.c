#include <stdio.h>

extern char* int2str(int N, char* s);

static char num_str[50];

char* impnum(int num) {
    int2str(num, num_str);
    puts(num_str);
    
    return num_str;
}

int main(void) {
    impnum(11260850);

    return 0;
}
