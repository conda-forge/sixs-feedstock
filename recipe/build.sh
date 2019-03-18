#!/bin/bash

export FFLAGS=$(echo "${FFLAGS}" | sed "s/-fopenmp//g")
export FFLAGS="-ffpe-summary=none ${FFLAGS}"

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX $SRC_DIR

make -j${CPU_COUNT}
make install
