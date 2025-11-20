# Migration Instructions
If you'd like support of have any questions, please join our matrix channel.

Is your system using the legacy images? To check
- Open a terminal and run `rpm-ostree status'. The output will list your deployments. If the path includes "ghcr.io/lauretano/t2-atomic", you're on a legacy image. Proceed to migrate. If it already says ghcr.io/kansei-os/t2-atomic you're on the current images and do not need to proceed.

## Step 1: Pin your current deployment
To protect your working deployment in the event you need to roll back, open a terminal window and run `sudo ostree admin pin 0`. If you have a staged update pending, you may get an error, in this case run the command with "pin 1" instead. Verify the correct deployment is pinned by running `sudo bootc status`, the output will indicate "Pinned: yes" for the protected deployment.

## Step 2: Prepare the deployment (bootc switch)
- You'll be running the bootc switch command, and will need to select an image to migrate to, based on the image you're currently running. Most of the image names have carried over. That is, ghcr.io/lauretano/t2-atomic-bluefin:latest becomes ghcr.io/kansei-os/t2-atomic-bluefin:latest. 

open a terminal window and "sudo bootc switch [image URI]" where the URI is one of:
  *  ghcr.io/kansei-os/t2-atomic-silverblue:latest
  *  ghcr.io/kansei-os/t2-atomic-bazzite:latest
  *  ghcr.io/kansei-os/t2-atomic-bluefin:latest
  *  Additional images may be available, check the [packages for this repo](https://github.com/orgs/kansei-os/packages?repo_name=t2-atomic) for more info.
  
- Bootc will download layers and chunks as needed (a few gigabytes) and process the transaction. It'll show progress as the download happens. If all goes well, the update will be staged for the next reboot.
- To check the package changes run `rpm-ostree db diff`, this will output the package changes between the current deployment and the pending one.

## Step 3: Reboot to the new deployment
- Reboot the system. If there are any issues, you can power off and restart the system, and when the boot menu briefly appears press the down arrow to select the previous (pinned) deployment. 

## Support
Please join our matrix channel for any assistance.
