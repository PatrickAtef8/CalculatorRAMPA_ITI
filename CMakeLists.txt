cmake_minimum_required(VERSION 3.27)

set(CMAKE_GENERATOR "Ninja")

project(Calc C)

set(C-SOURCE main.c)
set(MODULES Sum subtraction multiplication Division ModulusModule)
set(DEFINED_NAMES "ALL" "SUM" "SUB" "MUL" "DIV" "MOD")

if(NOT COMMAND ConfigFeature)
    include(${CMAKE_CURRENT_SOURCE_DIR}/Scripts/GenerateConfig.cmake)
endif()

foreach(module IN LISTS MODULES)
    add_subdirectory(${module})
endforeach()

add_executable(${PROJECT_NAME} ${C-SOURCE})

foreach(lib IN LISTS MODULES)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${lib})
endforeach()

add_dependencies(${PROJECT_NAME} ConfigFeatureall_Target)

if(DEFINED ALL)
    ConfigFeature(${PROJECT_NAME} ${ALL})
endif()
