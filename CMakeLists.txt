cmake_minimum_required(VERSION 3.15)
find_package(ccache REQUIRED)

# find_program(CCACHE_PROGRAM ccache)
# if(CCACHE_PROGRAM)
#     # Support Unix Makefiles and Ninja
#     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
# endif()

project(compressor C)

find_package(ZLIB REQUIRED)

add_executable(${PROJECT_NAME} src/main.c)

target_link_libraries(${PROJECT_NAME} ZLIB::ZLIB ccache::ccache)
