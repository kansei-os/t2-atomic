#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/

dnf5 -y copr enable sharpenedblade/t2linux
dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core
dnf5 -y --repo=copr:copr.fedorainfracloud.org:sharpenedblade:t2linux install kernel kernel-core kernel-modules kernel-modules-core
dnf5 -y install t2fanrd t2linux-audio
dnf5 -y copr disable sharpenedblade/t2linux

systemctl enable t2fanrd.service

# installing some packages for full support of apple ecosystem, 
# like sg3_utils to support USB superdrive slot load operation,
# and cli apps to access hardware sensors
dnf5 install -y sg3_utils wodim lm_sensors powertop radeon-profile
