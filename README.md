# T2-Atomic (bootc)
Fedora/CentOS Desktop Images, built for T2 Macs, with transactional upgrades and rollbacks, delivered using OCI/container images. **Now with more [bootc](https://bootc-dev.github.io/bootc/)**.
## Alpha-state Project
* There are a couple routes possible to install T2-Atomic. Unfortunately, until we can find a way to load the t2linux kernel during the ISO install process, the install needs to be performed without use of the internal keyboard/trackpad on MacBooks. The installation is performed offline, and on first boot the t2linux kernel, wifi/bt firmware, and other essential tooling for the best T2 experience possible will all be in place.
* If you're command line comfortable, you can use an existing ISO, and "bootc switch" to T2-Atomic. For this, download the ISO of Bazzite, Bluefin, Silverblue, and proceed to install with an external keyboard and mousing device. Note that if you select to encrypt your data (you should) during install, you won't be able to use the internal keyboard to type the unlock passphrase until the t2linux kernel is installed. Keep the external keyboard handy until you know you're in the clear.
  * on first boot post-install, open a terminal window and "sudo bootc switch [image URI]" where the URI is one of:
    *  ghcr.io/kansei-os/t2-atomic-silverblue:latest
    *  ghcr.io/kansei-os/t2-atomic-bazzite:latest
    *  ghcr.io/kansei-os/t2-atomic-bluefin:latest
  *  Additional images may be available, check the [packages for this repo](https://github.com/orgs/kansei-os/packages?repo_name=t2-atomic) for more info.
* Upcoming: when we have ISOs ready to publish, you'll be able to download them here for an easier installation. At this time it'll still require the external input devices during install, but on first boot all the hardware that can be enabled will be. There won't be any need to use the command line to get set up if you're using a full desktop environment such as Plasma on Bazzite, Gnome on Bluefin, or Gnome on Silverblue.

#### Do you have a T2 Mac? 
This is the last Intel generation of most models before the Apple Silicon transition. Including models like the 2018-2019 MacBook Pro 13", the 2019 MacBook Pro 16", and some Mac Minis and iMacs. Sadly many of these models have already been dropped from support from the upcoming Mac OS 26 Tahoe (coming fall 2025). Apple would prefer if you traded in on some fresh Apple Silicon, but for those of us who love how Linux can breathe fresh life into "old" hardware, these computers can still make great workstations for years to come, with the latest open source packages (while Apple sunsets rosetta2 for no reason other than they want to). 
For a more comprehensive list of T2 Macs see [the wiki](https://github.com/kansei-os/t2-atomic/wiki/T2-Hardware)

#### Do you want to use a Fedora Silverblue or another Atomic desktop on your T2 Mac?
If you've wanted to use Universal Blue's popular Bazzite and Bluefin images, or Fedora Silverblue, Sway Atomic, or similar but ran into the trouble of them not being operational on your T2 Mac, you've come to the right place. This repository builds a variety of Fedora Atomic Desktop images, customized for T2 Macs, using bootc. This is effectively a fork of [T2 Atomic](https://github.com/lauretano/t2-atomic/), which was based on rpm-ostree and blue-build.org tooling.

# Upcoming Features Planned
* wifi/bluetooth firmware via customized script that generates a sysext (systemd-sysext) to "bolt on" the firmware. This will allow more flexibility for those who may not want to run more proprietary code than necessary.
* more image variants

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
You are installing Linux on a Macbook, you've already come so far, you got this. Day to day, you can forget there's a command line. You may see some white text on black screen during boot and shutdown, or after login. It can be minimized and replaced with pretty pictures/animations if you'd like. The installation from ISO should be possible using just a GUI. On Linux, the command line powerful but nothing to be afraid of, especially due to the immutable nature of T2-Atomic. You can almost always roll back (from the command line of course!). We'll keep the commands as simple as possible. If we "finish" all the project to-dos we can definitely consider some basic graphical tools for things like switching image variants, adjusting T2-specific settings, and manual rollbacks.

Updates happen in the background (on a timer or after boot) and are applied on the next boot. We don't do any intentional notification of the updates as it's meant to be mostly passive the way a chromebook is. You can use the command line to check update status and see which packages have been updated, if any of them are security fixes, etc -- if you care. You don't need to care, that's what we're here for. Just reboot daily if you can, easy on a laptop that can't suspend, amirite?
