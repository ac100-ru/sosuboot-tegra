#!/bin/sh

DEVICE=$(lsblk -o NAME |grep boot0)

echo 0 > "/sys/block/$DEVICE/force_ro"

dd if="/boot/paz00.bct.new" of="/dev/$DEVICE"

echo 1 > "/sys/block/$DEVICE/force_ro"
