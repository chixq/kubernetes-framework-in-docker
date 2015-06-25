# Running Kubernetes-Mesos Framework In Docker

This is the mod version of [K8SM in Docker](https://github.com/mesosphere/kubernetes-mesos/tree/master/docker), which includes etcd, golang env, api-server, controller-manager, scheduler. 

**You can run this anywhere within Docker. The original one must be placed on the same node of Mesos master, that is no cool.** (because of the scheduler driver callback endpoint issue).

Since this mod version doesn't have local mesos included.
So you must docker run this container with mesos master endpoint(or zookeeper endpoint)

1. build image with Docker file.
```
$ git clone git@github.com:chixq/kubernetes-framework-in-docker.git
$ cd kubernetes-framework-in-docker && docker build -t <TAG> .
```

2. Run with mesos master endpoint (or zookeeper's)
```
$ docker run -p 8888:8888 -p 10255:10255  --net=host -v /tmp/k8sm-logs:/tmp/k8sm-logs <TAG> <MESOS_MASTER:5050>
```


**PS:**

1. -p represent to api-server's port mapping.

2. -v represent to volumes attached. (Check K8SM logs at /tmp/k8sm-logs)

3. expose 8888 for API server.

4. expose 10255 for kube-scheduler driver callback.

5. --net=host since this is an known issue of framework in container, we have to run container under host networking mode as a work around.
