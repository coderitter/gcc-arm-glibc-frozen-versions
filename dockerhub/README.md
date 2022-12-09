# A Docker image for specific ARM GCC / glibc versions

This Docker image contains the compiled ARM GNU compiler toolchain with the specified glibc version.

## How to use this image

In your project, create a shell script for the RISC V compiler executable. You can name the file `arm-linux-gnueabihf-g++-9` which is the exact name of the ARM compiler executable inside the Docker container. Put the following content inside of it and replace the `X` with the version you want, for example `gcc-9.3.0_glibc-2.31`.

```bash
#!/bin/sh
docker run --rm --entrypoint arm-linux-gnueabihf-g++-9 --volume $PWD:/hostdir coderitter/coderitter/gcc-arm-glibc-frozen-versions:gcc-X.X.X_glibc-X.XX "$@"
```

This call to `docker run` will create a temporary Docker container with the current directory mounted into it. It then executes the ARM compiler executable and forwards any parameters which were made when the script was executed.

The last step is to set the permission of the file so that is executable.

```bash
chmod a+x arm-linux-gnueabihf-g++-9
```

Now you can use the script as if the compiler itself was installed on your host system. If the needed Docker image is not present, Docker will automatically download it from the Docker Hub.

```bash
./arm-linux-gnueabihf-g++-9 -std=c++17 -Wall -o build/firmware.a
```

You can also head to the [Coderitter GitHub repository](https://github.com/c0deritter/gcc-arm-glibc-frozen-versions) which contains ready-to-use shell script files including the one of this example.

## Environment variables

There are no environment variables that could be used for configuration.