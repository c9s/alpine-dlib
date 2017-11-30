FROM alpine:latest

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
&& apk update \
&& apk add --no-cache git \
&& apk add --no-cache cmake \
&& apk add --no-cache g++ \
&& apk add --no-cache make \
&& apk add --no-cache jpeg-dev \
&& apk add --no-cache giflib-dev \
&& apk add --no-cache libpng-dev \
&& apk add --no-cache boost-dev \
&& apk add --no-cache gearman-dev \
&& apk add --no-cache openblas-dev  \
&& apk add --no-cache jsoncpp-dev \
&& apk add ca-certificates wget \
&& rm -rf /var/cache/apk/*


RUN wget -c -q https://github.com/davisking/dlib/archive/master.tar.gz \
&& tar xvf master.tar.gz \
&& mv dlib-master dlib \
&& (mkdir -p dlib/build \
    && cd dlib/build \
    && cmake .. && make -j4 && make install) \
&& rm master.tar.gz
