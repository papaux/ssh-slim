# ssh-slim

A minimal docker image for running SSH commands based on alpine distribution. Perfect for integrating in a CI pipeline.

The image is available in [docker hub](https://hub.docker.com/repository/docker/papaux/ssh-slim)

## Usage

A private key needs to be provided to the container in the `SSH_PRIVATE_KEY` environment variable.

### docker run

For example, to laod the private key from a file:

``
docker run --rm -ti -e SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" papaux/ssh-slim ssh <user>@<host> ls
``

### Gitlab CI

Example of a deploy stage in `.gitlab-ci.yml` using this image.

The SSH private key is stored in the Gitlab project configuration
as a secret with the name `${YOUR_GITLAB_SECRET_PRIVATE_KEY}`

```
deploy to staging:
  stage: staging
  image: papaux/ssh-slim
  environment:
    name: staging
    url: https://staging.your-service.com
  only:
    - master
  variables:
    SSH_PRIVATE_KEY: ${YOUR_GITLAB_SECRET_PRIVATE_KEY}
    GIT_STRATEGY: none
  script:
    - ssh dokku@staging.your-service.com git:from-image <your-app> <your-docker-image>
```

## Build

```
docker build -t ssh-slim .
```

## Limitations

Currently the image only supports ssh keys without passphrase.

## Versioning and CI

The image tag follows the alpine base image version set in the `Dockerfile` (`FROM alpine:<version>`).
For example `FROM alpine:3.20` publishes `papaux/ssh-slim:3.20`, `papaux/ssh-slim:3.20.<patch>` and `papaux/ssh-slim:latest`.

Dependabot is configured to update the image weekly based on Alpine releases.
