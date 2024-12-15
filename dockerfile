# Use an official Ubuntu image as the base
FROM arm64v8/ubuntu:latest

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Update and upgrade the system, install dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y \
    git \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the XMRig repository and build the miner
RUN git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

# Replace these placeholders with your wallet ID and worker name
ENV WALLET_ID=4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC
ENV WORKER_NAME=pminer

# Start the miner with the specified pool, wallet ID, and worker name
CMD ["bash", "-c", "/app/xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u $WALLET_ID -p $WORKER_NAME"]
