cmake_minimum_required(VERSION 3.22)
# find_package(ccache REQUIRED)

project(compressor C)

find_package(ZLIB REQUIRED)

add_executable(${PROJECT_NAME} src/main.c)

target_link_libraries(${PROJECT_NAME} ZLIB::ZLIB)
