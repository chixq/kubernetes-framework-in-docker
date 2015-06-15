# Running Kubernetes-Mesos In Docker

This is the mod version [K8SM in Docker](https://github.com/mesosphere/kubernetes-mesos/tree/master/docker), which includes etcd, golang env, api-server, controller-manager, scheduler. 

Since this mod version doesn't have local mesos included.
So you must docker run this container with mesos master endpoint(or zookeeper endpoint)

1. build image with Docker file.
```
$ git clone git@github.com:chixq/kubernetes-framework-in-docker.git
$ cd kubernetes-framework-in-docker && docker build -t <TAG> .
```

2. Run with mesos master endpoint (or zookeeper's)
```
$ docker run -p 8888:8888 -v /tmp/k8sm-logs:/tmp/k8sm-logs <TAG> <MESOS_MASTER>
```

ps.
-p represent to api-server's port mapping.
-v represent to volumes attached. (Check K8SM logs at /tmp/k8sm-logs)
