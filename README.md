# PCS3432

Repositório para os exercícios de Laboratório de Processadores.

Os programas foram desenvolvidos para ARMv7 usando a imagem de docker [epiceric/gcc-arm](https://hub.docker.com/r/epiceric/gcc-arm).

## Instalação

Primeiramente é preciso instalar o docker (veja [esse script](https://github.com/lucastrschneider/simon-setup/blob/main/docker_install.sh)).

Em seguida, basta dar pull da imagem.

```bash
docker pull epiceric/gcc-arm
```

## Utilização

Para rodar a imagem, execute o script `./run_docker.sh`. A pasta **src** desse repositório será montada como volume em **~/student/src** na imagem.

## Referências

- [Apostila do curso](docs/ARMLabMannual.pdf)
- [Repositório do epiceric/gcc-arm](https://github.com/EpicEric/gcc-arm)
- [Site da disciplina](https://www2.pcs.usp.br/~jkinoshi/2022/labmicro-22sem.html)
- [Basics on ARM Processor](http://linux-kernel-lab.blogspot.com/2018/04/basics-on-arm-processor.html)
