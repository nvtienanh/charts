cmake_minimum_required(VERSION 3.16)

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    # Support Unix Makefiles and Ninja
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()

project(main)

add_executable(main main.cpp)

install(TARGETS main)

enable_testing()
add_test(NAME main COMMAND main)