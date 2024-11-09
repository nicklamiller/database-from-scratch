cmake_minimum_required(VERSION 3.15)
project(SqliteProject VERSION 1.0 LANGUAGES C)

# Specify the C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Prefer Clang if available
find_program(CMAKE_C_COMPILER clang)

# Check for required headers for ssize_t and getline compatibility
include(CheckIncludeFile)
check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
if (HAVE_SYS_TYPES_H)
    add_compile_definitions(HAVE_SYS_TYPES_H)
endif()

# Add the sqlite.c file to the project and specify the output name
add_executable(database_app sqlite.c)

# Link standard libraries (if needed)
target_link_libraries(database_app m)

# Add definitions and include directories for portability
target_include_directories(database_app PRIVATE ${CMAKE_SOURCE_DIR})

# Ensure sys/types.h is included if available to define ssize_t
target_compile_definitions(database_app PRIVATE _GNU_SOURCE)
