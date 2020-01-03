cmake_minimum_required(VERSION 3.15)
project(hello_flann)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Xpreprocessor -fopenmp -Wno-unused-command-line-argument")

add_executable(hello_flann hello_flann.cpp)
add_executable(hello_openmp hello_openmp.cpp)

set(FLANN_ROOT "/usr/local/Cellar/flann/1.9.1_7")
set(LZ4_ROOT "/usr/local/Cellar/lz4/1.9.2")
set(HDF5_ROOT /usr/local/Cellar/hdf5/1.10.5_1)
set(OpenMP_ROOT "/usr/local/Cellar/libomp/9.0.0")

include_directories("${OpenMP_ROOT}/include")
include_directories("${LZ4_ROOT}/include")
include_directories("${HDF5_ROOT}/include")
include_directories("${FLANN_ROOT}/include")

target_link_directories(hello_flann
        PUBLIC ${LZ4_ROOT}/lib
        PUBLIC ${HDF5_ROOT}/lib
        PUBLIC ${FLANN_ROOT}/lib
        PUBLIC ${OpenMP_ROOT}/lib
        )
target_link_directories(hello_openmp
        PUBLIC ${OpenMP_ROOT}/lib
        )

target_link_libraries(hello_flann "lz4")
target_link_libraries(hello_flann "hdf5_cpp")
target_link_libraries(hello_flann "hdf5")
target_link_libraries(hello_flann "flann_cpp")
target_link_libraries(hello_flann omp)

target_link_libraries(hello_openmp omp)

find_package(Threads REQUIRED)
target_link_libraries(hello_openmp Threads::Threads)


target_link_options(hello_openmp PUBLIC "-v")
target_link_options(hello_flann PUBLIC "-v")
