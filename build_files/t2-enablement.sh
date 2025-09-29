#!/bin/bash

set -ouex pipefail
#kver="6.15.3-210.t2.fc42.x86_64"
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
dnf5 -y install dnf5-plugins python3-jsonschema
dnf5 -y copr enable sharpenedblade/t2linux
dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core kernel-uki-virt kernel-modules-extra \
  kernel-headers kernel-tools kernel-tools-libs
#dnf5 -y remove kernel-uki-virt kernel-tools kernel-tools-libs kernel-modules-extra kernel-headers
dnf5 -y versionlock delete kernel kernel-core kernel-modules \
  kernel-headers kernel-modules-core kernel-tools kernel-tools-libs
dnf5 -y --repo=copr:copr.fedorainfracloud.org:sharpenedblade:t2linux install kernel kernel-core \
  kernel-modules kernel-modules-core kernel-tools kernel-tools-libs kernel-uki-virt

#rpm-ostree override replace --experimental \
#    --from repo=copr:copr.fedorainfracloud.org:sharpenedblade:t2linux \
#    kernel kernel-core \
#    kernel-modules kernel-modules-core \
#    kernel-tools kernel-tools-libs \

dnf5 -y install t2linux-release #per sharpenedblade this will continue as the metapackage to include all the t2 parts
rm -f /usr/share/pipewire/pipewire.conf.d/raop.conf

# remove packages from fedora image macs don't need
dnf5 -y remove tiwilink-firmware nxpwireless-firmware nvidia-gpu-firmware mt7xxx-firmware iwlegacy-firmware \
  iwlwifi-dvm-firmware iwlwifi-mvm-firmware qcom-wwan-firmware
dnf5 -y copr disable sharpenedblade/t2linux

# installing some packages for full support of apple ecosystem,
# like sg3_utils to support USB superdrive slot load operation,
# and cli apps to access hardware sensors
dnf5 install -y lm_sensors sg3_utils wodim xorriso

# install IWD and radio software
# iwd as backend seems to work better than wpa_supplicant on this hardware
dnf swap -y wpa_supplicant iwd
cat >> /etc/NetworkManager/conf.d/iwd.conf << EOF
[device]
wifi.backend=iwd
EOF

mkdir -p /lib/firmware/brcm
tar -xf /ctx/common/radio.tar -C /lib/firmware/brcm

# applying some T2 customizations
systemctl mask suspend.target
systemctl enable t2fanrd.service

dnf5 install -y fedora-release-ostree-desktop

dnf clean all

#regen initramfs after kernel install. this is required for
# the internal keyboard to be usable for early boot (disk unlock)

KERNEL_VERSION="$(rpm -q --queryformat="%{EVR}.%{ARCH}" kernel-core)"
export DRACUT_NO_XATTR=1
/usr/bin/dracut --no-hostonly --kver "$KERNEL_VERSION" --reproducible --zstd -v --add ostree -f "/lib/modules/$KERNEL_VERSION/initramfs.img"
