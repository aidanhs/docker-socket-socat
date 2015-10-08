docker-socket-socat
===================

Useful to hit other containers during `docker build`.

As of 1.8, names of containers are automatically inserted into /etc/hosts, so
if you run this container with

```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name dsocket aidanhs/socket-socat
```

you can have an instruction like this in your Dockerfile

```
RUN docker -H tcp://dsocket:2375 ps
```

and it'll work!

This is great if you're using a Dockerfile to drive an Ansible playbook which
uses the Docker connection plugin. Or for any build tool to drive Docker
really - if your apps can run in a reproducible environment, why not your image
build tools!?

Security
--------

Running this gives anyone on your machine root access (exactly the same as if
they have access to run Docker already).
