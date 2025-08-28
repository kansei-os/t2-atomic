#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable ublue-os/packages
dnf5 -y config-manager setopt copr:copr.fedorainfracloud.org:ublue-os:packages.enabled=0
dnf5 -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:packages install ublue-brew
