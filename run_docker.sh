#!/usr/bin/env bash

docker run --network="host" --rm -ti -v "$PWD/src":/home/student/src epiceric/gcc-arm