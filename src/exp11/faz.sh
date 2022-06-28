arm-none-eabi-as -c -mcpu=arm926ej-s -g kernel.s -o kernel.o
arm-none-eabi-gcc -c -mcpu=arm926ej-s -Wall -Wextra -g tasks.c -o tasks.o
arm-none-eabi-ld -T kernel.ld kernel.o tasks.o -o kernel.elf
arm-none-eabi-objcopy -O binary kernel.elf kernel.bin
rm kernel.o tasks.o