FROM yoanlin/boost-dev:alpine-edge

RUN apk update \
    && apk add --no-cache git \
       cmake \
       g++ \
       make \
       jpeg jpeg-dev \
       libpng libpng-dev \
       giflib-dev \
       boost-dev \
       openblas-dev  \
       ca-certificates wget \
    && rm -rf /var/cache/apk/*

RUN wget -c -q https://github.com/davisking/dlib/archive/master.tar.gz \
&& tar xvf master.tar.gz \
&& mv dlib-master dlib \
&& (mkdir -p dlib/build \
    && cd dlib/build \
    && cmake .. && make -j && make install) \
&& rm master.tar.gz
