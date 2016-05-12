#!/bin/sh
#title       : post_build.sh
#description : customize target rootfs
#author      : zombah
#date        : 28/02/2016
#version     : 0.1
#usage       : post_build.sh <TARGET_DIR> <BR2_EXTERNAL> <BR2_VERSION_FULL> <BINARIES_DIR>
#--------------------------------------------------------------------------------

die() {
    echo "FATAL: $1"
    exit 1
}

[ 4 -ne $# ] && die "invalid number of parameters $# (expected 4)"
#Directory contains the target rootfs
TARGET_ROOTFS_DIR=$1
BOARD_DIR=$2
IMAGE_DIR=$4

#Copy current U-Boot binary to target fs
cp $IMAGE_DIR/u-boot-dtb-tegra.bin $TARGET_ROOTFS_DIR/boot/u-boot-dtb-tegra.bin

#Copy legacy U-Boot boot script source
cp $BOARD_DIR/board/tegra20/paz00/ext4_boot.cmd $TARGET_ROOTFS_DIR/boot/boot.script

#Compile boot script
mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "sosuboot" -d $TARGET_ROOTFS_DIR/boot/boot.script $TARGET_ROOTFS_DIR/boot/boot.scr
