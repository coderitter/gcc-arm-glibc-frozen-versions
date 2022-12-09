#!/bin/sh

# Use like this ./build <tag-number>
docker build --no-cache -t coderitter/gcc-arm-glibc-frozen-versions:$1 ..