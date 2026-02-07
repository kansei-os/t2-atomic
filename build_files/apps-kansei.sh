#!/bin/bash

set -ouex pipefail

### remove some things we don't need
dnf5 -y remove gnome-classic-session
dnf5 -y remove firefox firefox-langpacks
dnf5 -y remove chromium


### Install packages

dnf5 -y copr enable erikreider/SwayNotificationCenter
dnf5 -y copr enable alebastr/sway-extras
dnf5 -y copr enable shdwchn10/AllTheTools
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable alternateved/keyd

#### greeters, login things
dnf5 -y install greetd greetd-selinux tuigreet gtkgreet seatd

#### basic system things
dnf5 -y install bolt cups-pk-helper firewalld firewall-config fuse \
  glibc-langpack-en plymouth-plugin-label plymouth-plugin-two-step \
  podman-compose podman-machine podman-tui powerstat cockpit-system \
  cockpit-ostree cockpit-selinux cockpit-networkmanager \
  system-config-printer thermald zram-generator-defaults gnome-keyring-pam \
  gnome-keyring libsecret rtkit

#### wayland wm environment
dnf5 -y install tuned tuned-ppd xorg-x11-server-Xwayland \
  polkit xfce-polkit xdg-user-dirs dbus-tools dbus-daemon \
  wl-clipboard pavucontrol playerctl  vulkan-validation-layers \
  vulkan-tools gnome-disk-utility ddcutil waycheck wlogout \
  xwayland-satellite fuzzel rofi-wayland nwg-bar wev

#### sound networking etc
dnf5 -y install helvum network-manager-applet \
NetworkManager-openvpn NetworkManager-openconnect \
bluez bluez-tools blueman poweralertd pipewire-utils pipewire-config-raop

#### display
dnf5 -y install wlr-randr wlsunset brightnessctl swaylock \
  swayidle kanshi chayang wlopm

#### file manager, screenshot utils, status bar, etc
dnf5 -y install nautilus thunar thunar-archive-plugin thunar-volman \
  xarchiver imv p7zip unrar gvfs-mtp gvfs-gphoto2 gvfs-smb \
  gvfs-nfs gvfs-fuse gvfs-archive android-tools slurp grim \
  waybar dunst alacritty foot swayimg cups-pdf wf-recorder \
  SwayNotificationCenter swww papers-nautilus papers-previewer \
  papers-thumbnailer

#### cli utils
dnf5 -y install curl ffmpeg ffmpegthumbnailer fzf rsync zsh unrar-free xz wodim git cdrecord cdda2wav \
  btop greenboot greenboot-default-health-checks fastfetch dmg2img stow vim \
  tmux mc s-tui starship powertop grub2-tools-extra mkisofs wget2


#### theming, fonts
dnf5 -y install adobe-source-code-pro-fonts adwaita-fonts-all \
  adwaita-gtk2-theme adw-gtk3-theme breeze-icon-theme cascadia-fonts-all \
  cosmic-wallpapers default-fonts desktop-backgrounds-gnome \
  fedora-workstation-backgrounds fontawesome-fonts-all \
  google-noto-color-emoji-fonts google-noto-emoji-fonts \
  gnome-themes-extra gnome-icon-theme ibm-plex-fonts-all \
  jetbrains-mono-fonts-all paper-icon-theme  \
  papirus-icon-theme plymouth-theme-spinner plymouth-system-theme \
  qt5-qtwayland qt6-qtwayland sway-wallpapers \
  # rip f43 mozilla-fira-sans-fonts and mozilla-fira-mono-fonts

#### kansei spin
dnf5 -y install river xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  sysprof-cli fedora-easy-karma gcc make libtirpc-devel \
  python3-openidc-client cosmic-store cosmic-files \
  cosmic-edit cosmic-settings cosmic-settings-daemon \
  topgrade niri wayvnc cosmic-session brasero node-exporter \
  syncthing keyd rocm-opencl rocm-runtime\

dnf5 -y copr enable ublue-os/packages
dnf5 -y config-manager setopt copr:copr.fedorainfracloud.org:ublue-os:packages.enabled=0
dnf5 -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:packages install ublue-brew

dnf5 -y copr enable kylegospo/webapp-manager
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
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable alternateved/keyd
dnf5 -y copr disable ublue-os/packages
