# Minimal Docker image for UShER v0.3.5 using MAFFT v7.475 base
FROM niemasd/mafft:7.475
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install UShER
RUN apk update && \
    apk add boost-dev cmake g++ linux-headers protobuf-dev && \
    wget -qO- "https://github.com/yatisht/usher/archive/refs/tags/v0.3.5.tar.gz" | tar -zx && \
    cd usher-* && \
    wget -qO- "https://github.com/oneapi-src/oneTBB/archive/2019_U9.tar.gz " | tar -zx && \
    mkdir build && \
    cd build && \
    cmake -DTBB_DIR=${PWD}/../oneTBB-2019_U9 -DCMAKE_PREFIX_PATH=${PWD}/../oneTBB-2019_U9/cmake .. && \
    cd ../.. && \
    rm -rf usher-*
    
    # TODO: https://github.com/yatisht/usher/blob/master/installUbuntu.sh
    #wget -qO- "https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2" | tar -xj && \
    #cd samtools-* && \
    #./configure --without-curses && \
    #make && \
    #make install && \
    #cd .. && \
    #rm -rf samtools-*
