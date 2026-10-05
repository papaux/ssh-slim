# The alpine tag is tracked by Dependabot and drives the ssh-slim image tag.
FROM alpine:3.20

RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  git \
  bash

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
