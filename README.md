# arch-custom-kernel

A script to build an Arch Linux kernel with an AMD AGESA patch to work around an issue that prevents GPU passthrough from working. It could also be extended to include arbitrary kernel patches. The script automatically retrieves the latest `linux` package and applies the AGESA workaround patch to it.

## Prerequisites

Packages:

* `base-devel`
* `asp`

## Usage

Run `./patch.sh` to download the `linux` package, export its source, and apply the patch. This script will create the custom kernel package in `$HOME/build/linux`. After the process is complete, build and install the custom kernel using `makepkg -si`.

