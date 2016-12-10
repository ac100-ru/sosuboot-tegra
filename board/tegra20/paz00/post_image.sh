#!/bin/sh
#title       : post_image.sh
#description : create tegra rcm boot image with create_image.pl
#author      : zombah
#date        : 24/02/2016
#version     : 0.1
#usage       : post_image.sh <BINARIES_DIR> <BR2_EXTERNAL_SOSUBOOT_TEGRA_PATH> <BR2_VERSION_FULL> <BINARIES_DIR>
#--------------------------------------------------------------------------------

die() {
    echo "FATAL: $1"
    exit 1
}

[ 4 -ne $# ] && die "invalid number of parameters $# (expected 4)"

IMAGE_DIR=$1
BOARD_DIR=$2
VERSION=$3

perl $BOARD_DIR/board/tegra20/paz00/create_image.pl $IMAGE_DIR/u-boot-dtb-tegra.bin $IMAGE_DIR/zImage $IMAGE_DIR/rootfs.cpio.uboot $IMAGE_DIR/tegra20-paz00.dtb $BOARD_DIR/board/tegra20/paz00/rcm_boot.cmd $IMAGE_DIR/sos-uboot-$VERSION.bin
