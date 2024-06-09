ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  git \
  bash

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
