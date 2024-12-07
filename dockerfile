FROM ubuntu:latest

WORKDIR /crypt

RUN apt -y update \
    apt -y upgrade \
    apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y \
    git clone https://github.com/xmrig/xmrig.git \
    mkdir build \
    cd build \
    cmake .. \
    make \
    #./xmrig -o gulf.moneroocean.stream:10128 -u 4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC -p testgot
EXPOSE 3000