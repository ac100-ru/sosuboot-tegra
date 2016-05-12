echo "== tegra20-paz00 sdcard script =="
setenv bootargs 'root=/dev/mmcblk0p1 loader=uboot plymouth.enable=0 console=ttyS0,115200n8'
setenv initrd_high ''
setenv fdt_high ''
ext2load mmc 1:1 0x1000000 /boot/zImage
ext2load mmc 1:1 0x2000000 /boot/tegra20-paz00.dtb
bootz 0x1000000 - 0x2000000
