# arch-custom-kernel

A script to build an Arch Linux kernel with an AMD AGESA patch to work around an issue that prevents GPU passthrough from working. It could also be extended to include arbitrary kernel patches. The script automatically retrieves the latest `linux` package and applies the AGESA workaround patch to it.

## Prerequisites

Packages:

* `base-devel`
* `asp`

## Usage

Run `./patch.sh` to download the `linux` package, export its source, and apply the patch. This script will create the custom kernel package in `$HOME/build/linux`. After the process is complete, build and install the custom kernel using `makepkg -si`.

## AGESA Issue

* [Patch source](https://clbin.com/VCiYJ) (created by [/u/hansmoman](https://www.reddit.com/r/VFIO/comments/bqeixd/apparently_the_latest_bios_on_asrockmsi_boards/eo4neta/))
* [Problem introduced in AGESA 0.0.7.2](https://www.reddit.com/r/Amd/comments/bh3qqz/agesa_0072_pci_quirk/)
* [Problem still exists in AGESA 1.0.0.1](https://www.reddit.com/r/VFIO/comments/bvqxnt/psa_amd_agesa_1001_does_not_fix_the_pci/)
* [Alternative patching method](https://passthroughpo.st/agesa_fix_fedora/)

