cmake_minimum_required(VERSION 3.4.3)
project(hw1)

set(LLVM_INSTALL_DIR "/usr/lib/llvm/10" CACHE PATH "LLVM installation directory")
list(APPEND CMAKE_PREFIX_PATH "${LLVM_INSTALL_DIR}/lib/cmake/llvm/")

find_package(LLVM 10.0.0 REQUIRED CONFIG)

include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(NOT LLVM_ENABLE_RTTI)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

add_library(hw1 SHARED rename_symbols.cpp)

target_link_libraries(hw1
	"$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
