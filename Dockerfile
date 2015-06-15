FROM ubuntu:14.04.2
MAINTAINER Mesosphere <support@mesosphere.io>

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        wget \
        curl \
        tar \
        golang \
        && \
    apt-get clean
RUN curl --insecure -L  https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz -o etcd.tar.gz && \
    mkdir -p /tmp/etcd && \
    tar xf etcd.tar.gz -C /tmp/etcd
RUN mkdir -p /kubernetes-mesos/bin
RUN mkdir -p /kubernetes-mesos/k8sm-bin
RUN mv /tmp/etcd/*/etcd* /kubernetes-mesos/bin/
WORKDIR /kubernetes-mesos

COPY ./bin/* /kubernetes-mesos/bin/
COPY ./k8sm-bin/* /kubernetes-mesos/k8sm-bin/
COPY ./bin/mesos-cloud.conf /kubernetes-mesos/
ENV PATH /kubernetes-mesos/bin:/kubernetes-mesos/k8sm-bin:$PATH


ENTRYPOINT ["km-local"]
