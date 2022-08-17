cmake_minimum_required(VERSION 3.10)

# set the project name
project(hello VERSION 1.4)

# set(CMAKE_CXX_STANDARD 11)
# set(CMAKE_CXX_STANDARD_REQUIRED True)

configure_file(config.h.in config.h)
# add the executable
add_executable(hello hello.cpp)


# configure_file (
#   "${PROJECT_SOURCE_DIR}/Config.h.in"
#   "${PROJECT_BINARY_DIR}/Config.h"
#   )
# include_directories("${PROJECT_BINARY_DIR}")
# target_include_directories(hello PUBLIC "${PROJECT_BINARY_DIR}" )