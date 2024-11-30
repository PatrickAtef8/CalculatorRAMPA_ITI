cmake_minimum_required(VERSION 3.10)

# Define options to enable/disable specific operations (default to OFF)
option(ADD "Enable ADD operation" OFF)
option(SUB "Enable SUB operation" OFF)
option(MUL "Enable MUL operation" OFF)
option(DIV "Enable DIV operation" OFF)
option(MOD "Enable MOD operation" OFF)

# Path for the generated configuration header
set(OUTPUT_FILE ${CMAKE_BINARY_DIR}/configuration.h)

# Find the Python interpreter and script for generating configuration
find_package(Python REQUIRED)
find_program(CONFIG_SCRIPT NAMES gencfg.py PATHS ${CMAKE_CURRENT_SOURCE_DIR} REQUIRED)

# Function to handle feature configuration
function(ConfigMacro MODULE FEATURE_STATUS)
    if (FEATURE_STATUS STREQUAL "ON")
        # Enable feature, add the macro definition to the configuration
        message(STATUS "Feature enabled for: ${MODULE}")
        add_definitions(-D${MODULE}_ENABLED)
    elseif (FEATURE_STATUS STREQUAL "OFF")
        # Disable feature, remove any macro definitions for the module
        message(STATUS "Feature disabled for: ${MODULE}")
        # No action needed to "remove" defines, just don't define them
    else()
        message(WARNING "Invalid feature status for ${MODULE}: ${FEATURE_STATUS}. Must be ON or OFF.")
    endif()
endfunction()

# Prepare the INPUT argument for the Python script based on the options
set(ENABLED_FEATURES "")
if (ADD)
    list(APPEND ENABLED_FEATURES "ADD")
endif()
if (SUB)
    list(APPEND ENABLED_FEATURES "SUB")
endif()
if (MUL)
    list(APPEND ENABLED_FEATURES "MUL")
endif()
if (DIV)
    list(APPEND ENABLED_FEATURES "DIV")
endif()
if (MOD)
    list(APPEND ENABLED_FEATURES "MOD")
endif()

# Call the ConfigMacro function to generate the configuration based on enabled features
if (ENABLED_FEATURES)
    message(STATUS "Enabled features: ${ENABLED_FEATURES}")
    # Add a custom command to generate the configuration header
    add_custom_command(
        OUTPUT ${OUTPUT_FILE}
        COMMAND ${CMAKE_COMMAND} -E env python ${CONFIG_SCRIPT} ${ENABLED_FEATURES}
        COMMENT "Generating or updating ${OUTPUT_FILE} using ${CONFIG_SCRIPT} with enabled features"
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        VERBATIM
    )

    # Create a custom target to ensure the configuration is generated before building
    add_custom_target(
        GenerateConfig ALL
        DEPENDS ${OUTPUT_FILE}
    )
else()
    message(STATUS "No operations enabled. Configuration not generated.")
endif()

# Include the generated configuration header in your project
include_directories(${CMAKE_BINARY_DIR})
