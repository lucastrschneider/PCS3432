int mostra;

int main() {
    __asm__(
        "ldr r2, =mostra \n\t"
        "mov r1, #1 \n\t"
        "str r1, [r2] \n\t"
    );
    return 0;
}
