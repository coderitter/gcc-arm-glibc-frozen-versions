FROM debian

WORKDIR /hostdir

RUN apt update
RUN apt install g++-9-arm-linux-gnueabihf -y