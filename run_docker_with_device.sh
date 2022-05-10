#!/usr/bin/env bash

# TO DO: let device be a bash parameter
docker run --device=/dev/ttyS0 --rm -ti -v "$PWD/src":/home/student/src epiceric/gcc-arm