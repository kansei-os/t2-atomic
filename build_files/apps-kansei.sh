#!/bin/bash

set -ouex pipefail

### Install packages

dnf5 -y copr enable erikreider/SwayNotificationCenter
dnf5 -y copr enable alebastr/sway-extras
dnf5 -y copr enable shdwchn10/AllTheTools
dnf5 -y copr enable yalter/niri

#### greeters, login things
dnf5 -y install greetd greetd-selinux tuigreet gtkgreet seatd

#### wayland wm environment
dnf5 -y install tuned tuned-ppd xorg-x11-server-Xwayland \
  polkit xfce-polkit xdg-user-dirs dbus-tools dbus-daemon \
  wl-clipboard pavucontrol playerctl qt5-qtwayland \
  qt6-qtwayland vulkan-validation-layers vulkan-tools \
  gnome-disk-utility ddcutil waycheck adw-gtk3-theme wlogout \
  xwayland-satellite

#### sound networking etc
dnf5 -y install helvum network-manager-applet \
NetworkManager-openvpn NetworkManager-openconnect \
bluez bluez-tools blueman poweralertd 

#### display
dnf5 -y install wlr-randr wlsunset brightnessctl swaylock \
  swayidle kanshi chayang wlopm
#### file manager, screenshot utils, status bar, etc
dnf5 -y install thunar thunar-archive-plugin thunar-volman \
  xarchiver imv p7zip unrar gvfs-mtp gvfs-gphoto2 gvfs-smb \
  gvfs-nfs gvfs-fuse gvfs-archive android-tools slurp grim \
  waybar dunst alacritty foot swayimg cups-pdf wf-recorder

#### theming, fonts
dnf5 -y install fontawesome-fonts-all gnome-themes-extra \
  gnome-icon-theme paper-icon-theme breeze-icon-theme \
  papirus-icon-theme yaru-theme google-noto-emoji-fonts \
  SwayNotificationCenter swww cascadia-fonts-all mozilla-fira-sans-fonts \
  mozilla-fira-mono-fonts jetbrains-mono-fonts-all ibm-plex-fonts-all

#### kansei spin
dnf5 -y install river xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  s-tui mc powertop sysprof-cli tmux vim fedora-easy-karma gcc make \
  libtirpc-devel python3-openidc-client cosmic-store cosmic-files \
   cosmic-edit cosmic-settings cosmic-settings-daemon dmg2img stow \
   topgrade niri
      
