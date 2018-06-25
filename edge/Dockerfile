FROM yoanlin/alpine-boost-dev:edge

RUN apk update \
    && apk add --no-cache git \
       cmake \
       libstdc++ libgcc g++ \
       make \
       jpeg jpeg-dev \
       libpng libpng-dev \
       giflib giflib-dev \
       openblas \
       openblas-dev \
       ca-certificates curl wget \
    && rm -rf /var/cache/apk/*

WORKDIR /
# ARG BRANCH=master
ARG BRANCH=v19.13
RUN wget -c -q https://github.com/davisking/dlib/archive/${BRANCH}.tar.gz \
 && tar xf ${BRANCH}.tar.gz \
 && mv dlib-${BRANCH} dlib \
 && mkdir -p /dlib/build \
 && (cd /dlib/build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DDLIB_PNG_SUPPORT=ON -DDLIB_GIF_SUPPORT=ON -DDLIB_JPEG_SUPPORT=ON .. \
    && cmake --build . --config Release -- -j2 \
    && make install) \
 && rm -rf *.tar.gz /dlib/build
