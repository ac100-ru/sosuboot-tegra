# Sosuboot-tegra20-paz00
This is buildroot outside of tree board config for small tegra20 recovery system.

At this moment it contain config only for Toshiba AC100 (paz00)

## Build enviroment
Compare your build system to Buildroot requirements
> https://buildroot.org/downloads/manual/manual.html#requirement

## Get sources
Create working directory for example:
> mkdir sosuboot  
> cd sosuboot  

Download buildroot: 
> git clone git://git.buildroot.net/buildroot

Download this repository:
> git clone git://github.com/ac100-ru/sosuboot-tegra20-paz00

## Compile
Switch to buildroot directory:
> cd buildroot

Use sosuboot-tegra20-paz00 defconfig:
> make BR2_EXTERNAL=../sosuboot-tegra20-paz00 tegra20-paz00_defconfig

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
