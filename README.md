# T2-Atomic (bootc)
Fedora/CentOS Desktop Images, built for T2 Macs, with transactional upgrades and rollbacks, delivered using OCI/container images. **Now with more [bootc](https://bootc-dev.github.io/bootc/)**.
## Not Installable at this time
Do not attempt install just yet. We're just getting kicked off, getting the infrastructure in place to support transitioning existing T2-Atomic users to bootc. We hope to have an installable image by early July 2025. Thanks for your patience and support! 

#### Do you have a T2 Mac? 
This is the last Intel generation of most models before the Apple Silicon transition. Including models like the 2018-2019 MacBook Pro 13", the 2019 MacBook Pro 16", and some Mac Minis and iMacs. Sadly many of these models have already been dropped from support from the upcoming Mac OS 26 Tahoe (coming fall 2025). Apple would prefer if you traded in on some fresh Apple Silicon, but for those of us who love how Linux can breathe fresh life into "old" hardware, these computers can still make great workstations for years to come, with the latest open source packages (while Apple sunsets rosetta2 for no reason other than they want to). 
For a more comprehensive list of T2 Macs see [the wiki](https://github.com/kansei-os/t2-atomic/wiki/T2-Hardware)

#### Do you want to use a Fedora Silverblue or another Atomic desktop on your T2 Mac?
If you've wanted to use Fedora Silverblue, Sway Atomic, or similar but ran into the trouble of them not being operational on your T2 Mac, you've come to the right place. This repository intends to deliver Fedora Atomic Desktop images like Silverblue, as well as custom images of Universal Blue's popular Bluefin and Bazzite, customized for T2 Macs, using bootc. This is effectively a fork of [T2 Atomic](https://github.com/lauretano/t2-atomic/), which is based on rpm-ostree and blue-build.org tooling.

# Upcoming
Our first bootc test image is derived from the official Fedora bootc base image (aka Silverblue). We'll also add support for Universal Blue images like Bazzite, Bluefin, and Aurora --with a little bit of work, they have some additional packages we may need to modify/remove to ensure compatibility with the T2 kernel. Even a Centos Stream bootc image is possible.

### Fake FAQ until real Q's are A'd:
#### Why Atomic / Immutable / bootc?
Specific to our Macs, as T2 support in the mainline kernel changes, or utilities/workarounds that enable further hardware support come and go, we've got you. A simple, transactional upgrade delivers the best T2 support possible on Fedora, with minimal cognitive load for you.

Unlike Mac OS, where Apple continually reduces the featureset available to older hardware, with an atomic Linux image you get continual improvement, as long as there's community interest in keeping this around.
 
In current state, this isn't ready for public consumption, missing some rather critical components like wifi/bluetooth firmware. Testing is underway, using an existing T2-Atomic (the older rpm-ostree version) test MacBookPro15,2 (2018 13" 4-port).

#### What was wrong with the old T2 Atomic / rpm-ostree? Why a fork?

The installation of T2-Atomic was a series of command line steps, and required you have a USB keyboard, mouse, and wired ethernet adapter. It requires several reboots, each with additional command line steps to perform. Due to the way OCI images are delivered within the Anaconda installer, we weren't able to run the T2 kernel needed to have more built-in hardware operational.

The rpm-ostree method we had been using since Fedora 40 to override the base image kernel packages to replace with those from the [t2linux COPR](https://copr.fedorainfracloud.org/coprs/sharpenedblade/t2linux/) has been deprecated, and does appear to no longer work as of June 2025. It also limited us from expanding support to the popular Universal Blue images Bluefin (workstation-focused) and Bazzite (gaming-focused) as we weren't able to use the old method to override on those.

This is only a fork in that it's a ground-up rebuild of the project using more modern tooling. The old project started in 2023, using what was available at the time. Same crew (of one for now). With bootc, we should be able to deliver an installer ISO for the first time, greatly simplifying install. For an existing T2-Atomic workstation the goal is for it to be a relatively seamless "bootc switch" command to transition, once these images are at parity with the existing project.

#### Will I have to use a .. command line????
You are installing Linux on a Macbook, you've already come so far, you got this. Day to day, you can mostly forget there's a terminal. Some white text on black screen will appear from time to time, during boot and shutdown. It can be minimized. We endeavour to have the installation be free of command line, but at times on the installed system it may be unavoidable. It's also nothing to be afraid of, especially due to the immutable nature of T2-Atomic. You can almost always roll back. We'll keep the commands as simple as possible. If we "finish" all the project to-dos we can definitely consider some basic graphical tools for things like switching image variants, adjusting T2-specific settings, and manual rollbacks.

Updates happen in the background (on a timer or after boot) and are applied on the next boot. We don't do any intentional notification of the updates as it's meant to be mostly passive the way a chromebook is.
