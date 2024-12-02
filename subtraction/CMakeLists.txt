#new edits 

cmake_minimum_required(VERSION 3.27)

project(subtraction C)

file(GLOB C-SOURCE "./src/*.c/")

set(SCRIPT_PATH ${CMAKE_CURRENT_BINARY_DIR}/../)

if(NOT COMMAND ConfigFeature)
    include(${CMAKE_CURRENT_SOURCE_DIR}/../Scripts/GenerateConfig.cmake)
endif()

add_library(${PROJECT_NAME} STATIC ${C-SOURCE})

target_include_directories(${PROJECT_NAME} PUBLIC inc/ ${SCRIPT_PATH})

add_dependencies(${PROJECT_NAME} ConfigFeaturesub_Target)

if(DEFINED SUB)
    ConfigFeature(${PROJECT_NAME} ${SUB})
endif()

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    OUTPUT_NAME sub
)