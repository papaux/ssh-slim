#!/bin/sh

if [ -z "$SSH_PRIVATE_KEY" ]; then
  echo "Please set the environment variable SSH_PRIVATE_KEY."
  exit 1
fi

# dump the private key to a file
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# disable host checking to not get accept fingerprint prompts
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

exec "$@"
