set(SCRIPT_RUNNER python)
set(SCRIPT_NAME gencfg.py)

find_package(Python REQUIRED)
find_program(NAMES SCRIPT_NAME PATH ${CMAKE_SOURCE_DIR}/Scripts)

macro(ConfigFeature Module State)
    if(${Module} STREQUAL ${CMAKE_PROJECT_NAME})
        set(LowerTruncModule "all")
        set(SCRIPT_PATH ${CMAKE_CURRENT_BINARY_DIR}/../Scripts)
        set(CONFIG_PATH ${CMAKE_CURRENT_BINARY_DIR}/)
        set(CONFIG_FILE ${CMAKE_CURRENT_BINARY_DIR}/Configuration.h)
    else()
        # Prepare the module name to be passed to the script
        string(SUBSTRING ${Module} 0 3 TruncModule)
        string(TOLOWER ${TruncModule} LowerTruncModule)
        set(SCRIPT_PATH ${CMAKE_CURRENT_BINARY_DIR}/../../Scripts)
        set(CONFIG_PATH ${CMAKE_CURRENT_BINARY_DIR}/../)
        set(CONFIG_FILE ${CMAKE_CURRENT_BINARY_DIR}/../Configuration.h)
    endif()

    set(SUB_CONFIG_FILE "${CONFIG_PATH}${LowerTruncModule}.h")

    string(TOLOWER ${State} LowerState)

    add_custom_command(
        OUTPUT ${SUB_CONFIG_FILE}
        COMMAND ${CMAKE_COMMAND} -E env ${SCRIPT_RUNNER} ${SCRIPT_PATH}/${SCRIPT_NAME} --${LowerState} ${LowerTruncModule}
        COMMAND ${CMAKE_COMMAND} -E echo ${LowerState}
        COMMAND ${CMAKE_COMMAND} -E touch ${SUB_CONFIG_FILE}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/build
        COMMENT "Running python script to configure the features"
        VERBATIM
    )
    
    if(NOT TARGET ConfigFeature${LowerTruncModule}_Target)
        add_custom_target(ConfigFeature${LowerTruncModule}_Target DEPENDS ${SUB_CONFIG_FILE} VERBATIM)
    endif()
    
    foreach(module IN LISTS DEFINED_NAMES)
        if(NOT DEFINED ${module})
            string(TOLOWER ${module} LowerModule)
            
            if(NOT TARGET ConfigFeature${LowerModule}_Target)
                add_custom_target(ConfigFeature${LowerModule}_Target DEPENDS ${SUB_CONFIG_FILE})
            endif()
        endif()
    endforeach()

endmacro()
