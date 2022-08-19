FROM ubuntu:20.04 as runtime
RUN sed -i s@/archive.ubuntu.com/@/mirrors.tencent.com/@g /etc/apt/sources.list && \
sed -i s@/security.ubuntu.com/@/mirrors.tencent.com/@g /etc/apt/sources.list && \
export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends apt-utils && \
apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
apt-get install -y locales && echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && locale-gen

FROM runtime as developer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl vim cmake g++

FROM developer as builder
COPY . /usr/src/dockertest1
WORKDIR /usr/src/dockertest1
RUN cmake . && make

FROM runtime
COPY --from=builder /usr/src/dockertest1/hello /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/hello"]