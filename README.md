# T2-Atomic - now with more bootc

# Purpose
## warning: this is pre-alpha territory, don't install it even if you dare. Follow along and we'll announce a release when things are ready for public consumption. Expecteded in early July 2025.

#### Do you have a T2 Mac? 
This is the last Intel generation of most models before the Apple Silicon transition. Including models like the 2018-2019 MacBook Pro 13", the 2019 MacBook Pro 16", and some Mac Minis and iMacs. Sadly many of these models have already been dropped from support from the upcoming Mac OS 26 Tahoe (coming fall 2025). Apple would prefer if you traded in on some fresh Apple Silicon, but for those of us who love how Linux can breathe fresh life into "old" hardware, these computers can still make great workstations for years to come, with the latest open source packages (while Apple sunsets rosetta2 for no reason other than they want to). 

#### Do you want to use a Fedora Silverblue or another Atomic desktop on your T2 Mac?
If you've wanted to use Fedora Silverblue, Sway Atomic, or similar but ran into the trouble of them not being operational on your T2 Mac, you've come to the right place. This repository intends to deliver Fedora Atomic Desktop images like Silverblue, as well as custom images of Universal Blue's popular Bluefin and Bazzite, customized for T2 Macs, using bootc. This is effectively a fork of [T2 Atomic](https://github.com/lauretano/t2-atomic/), which is based on rpm-ostree and blue-build.org tooling.

#### Why Atomic / Immutable / bootc?
Specific to our Macs, as T2 support in the mainline kernel changes, as utilities that enable further hardware support come and go, or get redone in rust as one does, or as new workarounds for various outstanding issues are found, you're a simple, atomic upgrade away from getting those improvements delivered alongside system package updates.

Unlike Mac OS, where Apple continually reduces the featureset available to older hardware, with an atomic Linux image you get continual improvement, as long as there's community interest in keeping this around.
 
In current state, this isn't ready for public consumption, missing some rather critical components like wifi/bluetooth firmware. Testing is underway, using an existing T2-Atomic (the older rpm-ostree version) test MacBookPro15,2 (2018 13" 4-port). 

#### What was wrong with the old T2 Atomic / rpm-ostree? Why a fork?

The installation of T2-Atomic was a series of command line steps, and required you have a USB keyboard, mouse or trackpad, and a USB ethernet adapter. It requires several reboots, each with additional steps to perform. Due to the way the OCI images are delivered within the aging Fedora Anaconda installer limited us, as we weren't able to run the T2 kernel needed to have more built-in hardware operational.

The rpm-ostree method we were using to override the base image kernel packages to replace with those from the [t2linux COPR](https://copr.fedorainfracloud.org/coprs/sharpenedblade/t2linux/) has been deprecated and does appear to no longer work as of June 2025. It also limited us from expanding support to the popular Universal Blue images Bluefin (workstation-focused) and Bazzite (gaming-focused) as we weren't able to use the old method to override on those.

This is only a fork in that it's a ground-up rebuild of the project using new tooling. Same crew (of one for now). With bootc, we should be able to deliver an installer ISO for the first time, greatly simplifying install. For an existing T2-Atomic workstation the goal is for it to be a relatively seamless "bootc switch" command to transition, once these images are at parity with the existing project.

# Upcoming
Our first bootc test image is derived from the official Fedora bootc base image (aka Silverblue). We'll also add support for Universal Blue images like Bazzite, Bluefin, and Aurora --with a little bit of work, they have some additional packages we may need to modify/remove to ensure compatibility with the T2 kernel. Even a Centos Stream bootc image is possible.

# Upcoming Test Images
- t2-atomic:latest - this is derived from quay.io/fedora/fedora-bootc:42 with just the minimal changes to ensure the keyboard, trackpad, touchbar, and fans operate.
- t2-atomic-kansei:latest - this test image builds on the base image adding some greetd greeters (gtkgreet and tuigreet), a couple wayland window managers (river and niri), the long list of wayland wm tooling packages, and additional packages used on my personal workstation (cli/testing tools mostly). I also generally dogfood major changes in this image ahead of going public.
