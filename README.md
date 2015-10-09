docker-socket-socat
===================

A simple container to expose `/var/lib/docker.sock` on port 2375. Useful to hit
the Docker daemon during `docker build`.

As of 1.8, names of containers are automatically inserted into /etc/hosts, so
if you run this container with

```
docker run -d -v /var/run/docker.sock:/docker.sock --name dsocket aidanhs/socket-socat
```

you can have instructions like this in your Dockerfile

```
ENV DOCKER_HOST tcp://dsocket:2375
RUN docker ps
```

and it'll work!

This is great if you're using a Dockerfile to drive an Ansible playbook which
uses the Docker connection plugin. Or for any build tool to drive Docker
really - if your apps can run in a reproducible environment, why not your image
build tools!? One amusing thought is to use a Dockerfile to run a bunch of other
Dockerfiles - everything perfectly encapsulated.

Security
--------

Running this gives anyone on your machine root access.

If they have the ability to run arbitrary containers, they already had this.
