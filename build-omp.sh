#!/bin/bash -x

clang -Xpreprocessor -fopenmp -lomp -I"$(brew --prefix libomp)/include" -L"$(brew --prefix libomp)/lib" hello_openmp.c -o hello_openmp
