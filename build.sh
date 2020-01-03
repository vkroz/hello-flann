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
