#!/bin/sh

DEVICE=$(lsblk -o NAME |grep boot1)

echo 0 > "/sys/block/$DEVICE/force_ro"

dd if="/dev/zero" of="/dev/$DEVICE" 2>/dev/null

echo 1 > "/sys/block/$DEVICE/force_ro"
