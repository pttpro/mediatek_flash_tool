#!/bin/sh

ARG_PATH=$(brew --cellar argp-standalone)
ARG_VERSION=$(brew list --versions argp-standalone | tr ' ' '\n' | tail -1)

export CFLAGS="$CFLAGS -I$ARG_PATH/$ARG_VERSION/include/"
export LDFLAGS="$LDFLAGS -L$ARG_PATH/$ARG_VERSION/lib/ -largp"

if [ -d build ]; then
    rm -rf build
fi

mkdir build
cd build

meson ..
ninja

if [ $? -eq 0 ]; then
  mv flash_tool/flash_tool /usr/local/bin
  rm -rf ../build
  echo "\nTo enable flash_tool on your current terminal, run:\n  \`source ~/.zshrc\`\n"
fi
