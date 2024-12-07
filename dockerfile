# Use an official Ubuntu image as the base
FROM ubuntu:20.04

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
ENV WALLET_ID=your_wallet_id_here
ENV WORKER_NAME=your_worker_name_here

# Start the miner with the specified pool, wallet ID, and worker name
CMD ["bash", "-c", "/app/xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u $WALLET_ID -p $WORKER_NAME"]
