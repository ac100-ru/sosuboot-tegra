# Sosuboot-tegra20-paz00
This is buildroot outside of tree board config for small tegra20 recovery system.

At this moment it contain config only for Toshiba AC100 (paz00)

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
