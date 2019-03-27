#!/bin/bash

export FFLAGS=$(echo "${FFLAGS}" | sed "s/-fopenmp//g")


if [[ $(uname) == Linux ]]; then
  export FFLAGS="-ffpe-summary=none ${FFLAGS}"
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX $SRC_DIR

make -j${CPU_COUNT}
make install
