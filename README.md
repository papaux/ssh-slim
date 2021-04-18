# ssh-slim

A minimal docker image for running SSH commands based on alpine distribution.

The image is available in [docker hub](https://hub.docker.com/repository/docker/papaux/ssh-slim)

## Usage

A private key needs to be provided to the container in the `SSH_PRIVATE_KEY` environment variable.

### docker run

For example, to laod the private key from a file:

``
docker run --rm -ti -e SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" papaux/ssh-slim ssh <user>@<host> ls
``

### Gitlab CI

Example of a deploy stage in `.gitlab-ci.yml`:

```
TODO
```

## Build

```
docker build -t ssh-slim --build-arg ALPINE_VERSION=3.13 .
```

## Limitations

Currently the image only supports ssh keys without passphrase.

## Docker Hub build hook

Instead of providing one Dockerfile per version, this image relies on the configured docker tag
to fetch the corresponding alpine image version.

It will basically pick whatever "Docker Tag" is configured from the Build Rules. For instance:

![example-docker-hub-docker-tag](https://gist.githubusercontent.com/papaux/101c5efb2cc124ab594465572f43ac33/raw/31fb9105e45d983ff91113c8003e051a22e4620c/docker-hub-build-rules.png)

Documentation about build hooks is really hard to find, especially what is the default build command.

These links can be useful to understand:
- [What is a build hook](https://docs.docker.com/docker-hub/builds/advanced/#override-build-test-or-push-commands)
- [Example of a build hook](https://github.com/SamueleA/docker-hub-auto-build-tutorial/blob/ec2743d606bf290f6707547c8c1439d20bdf2298/hooks/build#L1)
- [Environment Variables](https://docs.docker.com/docker-hub/builds/advanced/#custom-build-phase-hooks)

