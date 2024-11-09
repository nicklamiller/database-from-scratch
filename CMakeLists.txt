cmake_minimum_required(VERSION 3.15)
project(SqliteProject VERSION 1.0 LANGUAGES C)

# Specify the C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Set the compiler
if(CMAKE_C_COMPILER_ID MATCHES "GNU" AND CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 13)
    message(STATUS "Using GCC ${CMAKE_C_COMPILER_VERSION}")
elseif(CMAKE_C_COMPILER_ID MATCHES "AppleClang" AND CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 15)
    message(STATUS "Using Apple Clang ${CMAKE_C_COMPILER_VERSION}")
else()
    message(FATAL_ERROR "Unsupported compiler version. GCC 13 or Apple Clang 15+ is required.")
endif()

# Add the sqlite.c file to the project
add_executable(database_app sqlite.c)

# Link standard libraries (if needed, though they are usually linked by default)
target_link_libraries(database_app m)
