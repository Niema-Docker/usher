# Minimal Docker image for UShER v0.3.4 using MAFFT v7.475 base
FROM mafft:7.475
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install UShER
RUN apk update && \
    apk add cmake && \
    wget -qO- "https://github.com/oneapi-src/oneTBB/archive/2019_U9.tar.gz " | tar -zx && \
    # TODO: https://github.com/yatisht/usher/blob/master/installUbuntu.sh
    #wget -qO- "https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2" | tar -xj && \
    #cd samtools-* && \
    #./configure --without-curses && \
    #make && \
    #make install && \
    #cd .. && \
    #rm -rf samtools-*
