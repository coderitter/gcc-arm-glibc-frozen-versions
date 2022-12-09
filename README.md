# A Docker file for specific ARM GCC / glibc versions

This repository contains a Docker file which can be used to create Docker images with specific ARM GCC compiler and glibc versions. Its purpose is to be able to compile a project with those specific versions which it was developed with.

## Docker Hub

There is prebuild ready-to-use Docker images available on [Docker Hub](https://hub.docker.com/r/coderitter/gcc-arm-glibc-frozen-versions). Use it like this.

In your project, create a shell script for the RISC V compiler executable. You can name the file `arm-linux-gnueabihf-g++-9` which is the exact name of the ARM compiler executable inside the Docker container. Put the following content inside of it and replace the `X` with the version you want, for example `gcc-9.3.0_glibc-2.31`.

```
#!/bin/sh
docker run --rm --entrypoint arm-linux-gnueabihf-g++-9 --volume $PWD:/hostdir coderitter/coderitter/gcc-arm-glibc-frozen-versions:gcc-X.X.X_glibc-X.XX "$@"
```

This call to `docker run` will create a temporary Docker container with the current directory mounted into Docker container. It then executes the RISC V compiler executable and forwards any parameters which were made when the script was executed.

The last step is to set the permission of the file so that is executable.

```bash
chmod a+x arm-linux-gnueabihf-g++-9
```

Now you can use the script as if the compiler itself was installed in your host system.

```bash
./arm-linux-gnueabihf-g++-9 -std=c++17 -Wall -o build/firmware.a
```

## Coderitter

The directory `dockerhub` contains the Docker Hub readme and Coderitter specific scripts to build the image.