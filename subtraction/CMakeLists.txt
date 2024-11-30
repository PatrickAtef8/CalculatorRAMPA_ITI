cmake_minimum_required(VERSION 3.16)
project(subtraction)

set(SOURCE_FILES src/subtraction.c)
set(INCLUDE_DIR ${CMAKE_SOURCE_DIR}/INC)

add_library(${PROJECT_NAME} src/subtraction.c)

target_include_directories(${PROJECT_NAME} PUBLIC inc)
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_BINARY_DIR})
