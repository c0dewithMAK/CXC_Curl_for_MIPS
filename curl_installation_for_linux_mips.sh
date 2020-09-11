#!/bin/bash
# Author : Mohd Amir Khan
# Date : 30th Aug, 2020

# First set-up the necessary configurations by executing 'buildconf'
# PS: This script assumes, user is present in the curl directory (repository)
chmod +x buildconf
./buildconf

# Export the necessary variables
export CROSS_COMPILE=/opt/toolchains/stbgcc-4.8-1.5/bin/mips-linux-gnu # This is the path to your Cross-Compiler, modify it accordingly.
export AR=${CROSS_COMPILE}-ar
export AS=${CROSS_COMPILE}-as
export LD=${CROSS_COMPILE}-ld
export RANLIB=${CROSS_COMPILE}-ranlib
export CC=${CROSS_COMPILE}-gcc
export CPP=${CROSS_COMPILE}-cpp
export NM=${CROSS_COMPILE}-nm
# Export below LIBS only when you want to compile and create a statically linked curl executable [size ~4 MB]
# In such case use '--disable-shared' while running configure script below and remove '--enable-shared'.
#export LIBS="-static"
export CFLAGS="-fomit-frame-pointer -O2 -DTCSUPPORT_CPU_RT63365 -DTC3262"

chmod +x configure
./configure \
	--enable-shared \
	--host=mips \
	--build=i386-pc-linux-gnu \
	--prefix=PATH_OF_INSTALLATION_DIRECTORY_FOR_CURL \
	--with-ssl=INSTALLATION_PATH_OF_ALREADY_INSTALLED_OPENSSL \

# Now, let's compile the files
make
# This installs the curl executable in <PATH_OF_INSTALLATION_DIRECTORY_FOR_CURL>/src/
make install
