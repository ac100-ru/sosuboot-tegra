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


For sosuboot-tegra20-paz00 RCM image use defconfig:
> make BR2_EXTERNAL=../sosuboot-tegra tegra20-paz00_defconfig

For SD card image use ext_defconfig:
> make BR2_EXTERNAL=../sosuboot-tegra tegra20-paz00_ext4_defconfig

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

## SDcard image  
Resulting image for SD card writing you can find in output/images  
under sdcard.img file name.  

To install it simply write to SD card, insert it into AC100 and boot it.  
> sudo dd if=sos-uboot-sdcard.img of=/dev/xxxx bs=4M; sync  
