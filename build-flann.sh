#!/bin/bash -x

CXX_FLAGS="-Xpreprocessor -fopenmp"

CXX_LIBS="-L$(brew --prefix libomp)/lib -lomp"
CXX_LIBS="$CXX_LIBS -L$(brew --prefix lz4)/lib -llz4"
CXX_LIBS="$CXX_LIBS -L$(brew --prefix hdf5)/lib -lhdf5_cpp -lhdf5"
CXX_LIBS="$CXX_LIBS -L$(brew --prefix flann)/lib -lflann_cpp"

CXX_INCLUDES="-I$(brew --prefix libomp)/include"
CXX_INCLUDES="$CXX_INCLUDES -I$(brew --prefix lz4)/include"
CXX_INCLUDES="$CXX_INCLUDES -I$(brew --prefix hdf5)/include"
CXX_INCLUDES="$CXX_INCLUDES -I$(brew --prefix flann)/include"

clang++ $CXX_FLAGS $CXX_INCLUDES $CXX_LIBS hello_flann.cpp -o hello_flann
