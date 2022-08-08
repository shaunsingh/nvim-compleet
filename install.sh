#!/usr/bin/env bash

set -e

cargo build --release 

# Place the compiled library where Neovim can find it.
mkdir -p lua

if [ "$(uname)" == "Darwin" ]; then
    mv target/release/libcompleet_plugin.dylib lua/compleet.so
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    mv target/release/libcompleet_plugin.so lua/compleet.so
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    mv target/release/compleet_plugin.dll lua/compleet.dll
fi
