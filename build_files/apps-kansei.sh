#!/bin/bash

set -ouex pipefail

### remove some things we don't need
dnf5 -y remove gnome-classic-session
dnf5 -y remove firefox firefox-langpacks


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
  wl-clipboard pavucontrol playerctl  vulkan-validation-layers \
  vulkan-tools gnome-disk-utility ddcutil waycheck wlogout \
  xwayland-satellite fuzzel rofi-wayland

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
  papirus-icon-theme google-noto-emoji-fonts \
  SwayNotificationCenter swww cascadia-fonts-all mozilla-fira-sans-fonts \
  mozilla-fira-mono-fonts jetbrains-mono-fonts-all ibm-plex-fonts-all \
  adwaita-gtk2-theme adw-gtk3-theme qt5-qtwayland qt6-qtwayland

#### kansei spin
dnf5 -y install river xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  s-tui mc powertop sysprof-cli tmux vim fedora-easy-karma gcc make \
  libtirpc-devel python3-openidc-client cosmic-store cosmic-files \
   cosmic-edit cosmic-settings cosmic-settings-daemon dmg2img stow \
   topgrade niri wayvnc unrar cosmic-session cosmic-wallpapers \
   fastfetch sway-wallpapers wodim brasero

dnf5 copr enable kylegospo/webapp-manager
dnf5 -y install webapp-manager



#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#flatpak install -y org.mozilla.firefox
#flatpak install -y org.kde.kalm

dnf5 -y config-manager addrepo --overwrite --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf5 -y install tailscale
systemctl enable tailscaled.service

dnf5 -y copr disable erikreider/SwayNotificationCenter
dnf5 -y copr disable alebastr/sway-extras
dnf5 -y copr disable shdwchn10/AllTheTools
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable kylegospo/webapp-manager
