#!/bin/sh

export CFLAGS="$CFLAGS -I/opt/homebrew/Cellar/argp-standalone/1.3/include/"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/Cellar/argp-standalone/1.3/lib/ -largp"

if [ -d build ]; then
    rm -rf build
fi

mkdir build
cd build

meson ..
ninja
