#new edits 

cmake_minimum_required(VERSION 3.27)

project(Sum C)

set(C-SOURCE ./src/sum.c)

file(GLOB C-SOURCE "./src/*.c/")

include_directories("./inc")

set(SCRIPT_PATH ${CMAKE_CURRENT_BINARY_DIR}/../)

if(NOT COMMAND ConfigFeature)
    include(${CMAKE_CURRENT_SOURCE_DIR}/../Scripts/GenerateConfig.cmake)
endif()

add_library(${PROJECT_NAME} STATIC ${C-SOURCE})

target_include_directories(${PROJECT_NAME} PUBLIC inc/ ${SCRIPT_PATH})

add_dependencies(${PROJECT_NAME} ConfigFeaturesum_Target)

if(DEFINED SUM)
    ConfigFeature(${PROJECT_NAME} ${SUM})
endif()

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    OUTPUT_NAME sum
)