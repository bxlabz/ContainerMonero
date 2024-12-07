FROM ubuntu:latest

WORKDIR /crypt
ARG wallet=4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC
ARG jobname=testkube

RUN apt -y update \
    apt -y upgrade \
    apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y \
    git clone https://github.com/xmrig/xmrig.git \
    mkdir build \
    cd build \
    cmake .. \
    make \
    ./xmrig -o gulf.moneroocean.stream:10128 -u{wallet} -p{jobname}
