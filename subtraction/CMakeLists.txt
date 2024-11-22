cmake_minimum_required(VERSION 3.16)


project(subtraction C)


include_directories("./inc")


add_library(${PROJECT_NAME} STATIC src/subtraction.c)
