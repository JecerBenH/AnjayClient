cmake_minimum_required(VERSION 3.24)
set(CMAKE_C_COMPILER clang)

project(AnjayClient C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_EXTENSIONS OFF)
add_compile_options(-Wall -Wextra)

find_package(anjay REQUIRED)

add_executable(${PROJECT_NAME} src/main.c src/utils/newObj.h src/utils/newObj.c)
target_link_libraries(${PROJECT_NAME} PRIVATE anjay)
