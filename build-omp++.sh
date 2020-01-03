#!/bin/bash -x

clang++ -Xpreprocessor -fopenmp -lomp -I"$(brew --prefix libomp)/include" -L"$(brew --prefix libomp)/lib" hello_openmp.cpp -o hello_openmp
