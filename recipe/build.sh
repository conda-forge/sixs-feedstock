#!/bin/bash

# Avoid weird messages that confuse py6s
# export FFLAGS="-ffpe-summary=none"
export FFLAGS="-g $FFLAGS"

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX $SRC_DIR

make -j${CPU_COUNT}
make install
