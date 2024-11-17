cmake_minimum_required(VERSION 3.29)

project(sum C)

# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})

include_directories("./inc")

#add_executable(${PROJECT_NAME} sum.c)

add_library(${PROJECT_NAME} STATIC src/sum.c)
