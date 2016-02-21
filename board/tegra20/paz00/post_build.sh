#!/bin/sh
#Directory contains the target rootfs
TARGET_ROOTFS_DIR=$1

#Board hostname
filename=$TARGET_ROOTFS_DIR/etc/hostname
echo sosuboot-paz00 > $filename
