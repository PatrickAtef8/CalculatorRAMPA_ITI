cmake_minimum_required(VERSION 3.27)

project(Divide C)

set(C-SOURCE ./src/Divide.c)

include_directories("./inc")

add_library(${PROJECT_NAME} STATIC ${C-SOURCE})
