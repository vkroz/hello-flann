


## Using CMake:
- file:///Users/vkroz/Downloads/Mastering%20CMake%20by%20K.Martin%20and%20B.Hoffman.pdf
- https://github.com/ttroy50/cmake-examples/tree/master/01-basic/H-third-party-library
- http://ttroy50.github.io/cmake-examples/
- https://gitlab.kitware.com/cmake/cmake
- https://github.com/PointCloudLibrary/pcl/blob/master/cmake/Modules/FindFLANN.cmake


## Using FLANN:
https://www.cs.ubc.ca/research/flann/uploads/FLANN/flann_manual-1.8.4.pdf

## Using OpenMP

Setup
```shell script
brew install libomp
```

```cmake
find_package(OpenMP REQUIRED) 
if(NOT TARGET OpenMP::OpenMP_CXX) 
    add_library(OpenMP_TARGET INTERFACE) 
    add_library(OpenMP::OpenMP_CXX ALIAS OpenMP_TARGET) 
    target_compile_options(OpenMP_TARGET INTERFACE ${OpenMP_CXX_FLAGS}) 
    find_package(Threads REQUIRED) 
    target_link_libraries(OpenMP_TARGET INTERFACE Threads::Threads) 
    target_link_libraries(OpenMP_TARGET INTERFACE ${OpenMP_CXX_FLAGS}) 
endif()
```

```shell script



ld \
-demangle 
-lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib 
-dynamic -arch x86_64 
-macosx_version_min 10.14.0 
-syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk 
-o hello_openmp 
-search_paths_first 
-headerpad_max_install_names 
CMakeFiles/hello_openmp.dir/hello_openmp.cpp.o
 -lc++ 
-lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.0/lib/darwin/libclang_rt.osx.a

```



Refs
- OpenMP on Mac
    - https://iscinumpy.gitlab.io/post/omp-on-high-sierra/
    - http://blog.llvm.org/2015/05/openmp-support_22.html
    - http://openmp.llvm.org/
    - https://stackoverflow.com/questions/35134681/installing-openmp-on-mac-os-x-10-11
- Cmake on OpenMP
    - https://cliutils.gitlab.io/modern-cmake/chapters/packages/OpenMP.html
- OpenMP tutorials
    - https://computing.llnl.gov/tutorials/parallel_comp/
    - https://computing.llnl.gov/tutorials/openMP/
    - https://www.openmp.org/resources/tutorials-articles/
    - https://www.openmp.org/wp-content/uploads/omp-hands-on-SC08.pdf
    - https://engineering.purdue.edu/~smidkiff/ece563/files/ECE563OpenMPTutorial.pdf

## Raw stuff

clang++ -std=c++11 -stdlib=libc++ example.cpp -o example_program
g++ -std=c++0x example.cpp -o example_program



open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg

CPP = /usr/local/opt/llvm/bin/clang
CPPFLAGS = -I/usr/local/opt/llvm/include -fopenmp
LDFLAGS = -L/usr/local/opt/llvm/lib

c++ -std=c++11 -stdlib=libc++ $CPPFLAGS $LDFLAGS \
-I /usr/local/Cellar/flann/1.9.1_7/include \
-L /usr/local/Cellar/flann/1.9.1_7/lib -lflann_cpp \
main.cpp -o main

