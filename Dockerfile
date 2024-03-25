FROM ubuntu:22.04

# Prepare build environment
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -qq -y install gcc g++ \
    cmake ccache curl wget pkg-config \
    libtool ninja-build 
RUN apt-get -qq -y install python3
RUN apt-get -qq -y install python3-pip
RUN pip3 install conan
