FROM ubuntu:latest

WORKDIR /crypt

RUN apt-get -y update
RUN apt-get -y upgrade
RUN sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN clone https://github.com/xmrig/xmrig.git
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make
RUN ./xmrig -o gulf.moneroocean.stream:10128 -u 4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC -p testgot