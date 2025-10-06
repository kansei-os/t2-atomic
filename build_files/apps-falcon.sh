#!/bin/bash

set -ouex pipefail

### Install docker-ce and such

dnf5 -y config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 -y install tuned tuned-ppd docker-ce docker-ce-cli containerd.io docker-buildx-plugin \
    docker-compose-plugin node-exporter wodim brasero
