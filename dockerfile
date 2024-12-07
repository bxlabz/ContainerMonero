# Use an official Ubuntu image as the base
FROM ubuntu:24.04

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Example: Clone the miner repository and build it
RUN git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

# Example: Copy or generate a configuration file
RUN echo '{"url": "gulf.moneroocean.stream:10128", "user": "4B4RSqqyoMQBNSnfTkWPFVTMVHzBGoY5WRn7BobfY1Myid5p6HaszDs7nyGVVNHGRTMh6HmFwxZMYR5Hc83frXULS1UfChC"}' > /app/xmrig/build/config.json

# Expose the miner port (if applicable)
EXPOSE 3333

# Set the entry point to run the miner
CMD ["/app/xmrig/build/xmrig"]
