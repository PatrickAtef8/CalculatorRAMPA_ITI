cmake_minimum_required(VERSION 3.10)

project(multiplication C)

include_directories(${PROJECT_SOURCE_DIR}/inc)

file(GLOB C-SOURCE "./src/*.c/")

set(SCRIPT_PATH ${CMAKE_CURRENT_BINARY_DIR}/../)

if(NOT COMMAND ConfigFeature)
    include(${CMAKE_CURRENT_SOURCE_DIR}/../Scripts/GenerateConfig.cmake)
endif()

add_library(${PROJECT_NAME} STATIC ${C-SOURCE})

target_include_directories(${PROJECT_NAME} PUBLIC inc/ ${SCRIPT_PATH})

add_dependencies(${PROJECT_NAME} ConfigFeaturemul_Target)

if(DEFINED MUL)
    ConfigFeature(${PROJECT_NAME} ${MUL})
endif()

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    OUTPUT_NAME mul
)
