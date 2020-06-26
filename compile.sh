#!/usr/bin/env bash

TARGET="aarch64-linux-musl"
OUTPUT="/opt/cross/"

cp config.mak.dist config.mak

# Improve build time
echo "OUTPUT = $OUTPUT" >> config.mak
echo "GCC_CONFIG += --enable-languages=c,c++" >> config.mak

# Compile TARGET and install
make
sudo make install

# Compress TARGET
sudo tar -cJf "$TARGET.tar.xz" -C "$OUTPUT" .
