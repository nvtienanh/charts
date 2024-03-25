FROM ubuntu:20.04

# Prepare build environment
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -qq -y install gcc g++ \
    cmake curl wget pkg-config \
    libtool ninja-build 
RUN apt-get -qq -y install python3
RUN apt-get -qq -y install python3-pip
RUN pip3 install conan
