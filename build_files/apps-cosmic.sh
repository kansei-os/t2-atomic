#!/bin/bash

set -ouex pipefail

### remove some things we don't need
dnf5 -y remove gnome-classic-session
dnf5 -y remove firefox firefox-langpacks
dnf5 -y remove chromium


### Install packages

dnf5 -y copr enable shdwchn10/AllTheTools


#### greeters, login things
dnf5 -y install greetd greetd-selinux seatd

dnf5 -y install cosmic-session cosmic-wallpapers
dnf5 -y install tuned tuned-ppd

#### sound networking etc
dnf5 -y install helvum network-manager-applet \
NetworkManager-openvpn NetworkManager-openconnect \
bluez bluez-tools blueman poweralertd

#### T2 and such
dnf5 -y install fastfetch wodim brasero node-exporter

dnf5 -y copr enable ublue-os/packages
dnf5 -y config-manager setopt copr:copr.fedorainfracloud.org:ublue-os:packages.enabled=0
dnf5 -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:packages install ublue-brew

dnf5 -y copr enable kylegospo/webapp-manager
dnf5 -y install webapp-manager



#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#flatpak install -y org.mozilla.firefox
#flatpak install -y org.kde.kalm

dnf5 -y copr disable shdwchn10/AllTheTools
dnf5 -y copr disable kylegospo/webapp-manager
