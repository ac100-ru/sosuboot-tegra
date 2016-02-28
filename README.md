# Sosuboot-tegra
This is Buildroot outside of tree board config for small Tegra recovery system.

At this moment it contain config only for Toshiba AC100 (tegra20-paz00)

## Build enviroment
Compare your build system to Buildroot requirements
> https://buildroot.org/downloads/manual/manual.html#requirement

## Extra dependencies
Host tegrarcm package require also libcryptopp.

## Get sources
Create working directory for example:
> mkdir sosuboot  
> cd sosuboot  

Download buildroot: 
> git clone git://git.buildroot.net/buildroot

Download this repository:
> git clone git://github.com/ac100-ru/sosuboot-tegra

## Compile
Switch to buildroot directory:
> cd buildroot

Use sosuboot-tegra20-paz00 defconfig:
> make BR2_EXTERNAL=../sosuboot-tegra tegra20-paz00_defconfig

Start compilation
> make

## RCM image
Resulting image for Tegra RCM loading you can find in output/images  
under sos-uboot.bin file name.  

To load it on paz00, you need to switch device to RCM mode, if device already  
use U-Boot use enterrcm command in U-Boot console or with hardware keys combo  
Ctrl+Esc+Power button. Then run tegrarcm tool:  

> tegrarcm --bct=bctfilename readbct  
> tegrarcm --bct=bctfilename --loadaddr=0x108000 --bootloader=path/to/sos-uboot.bin  
