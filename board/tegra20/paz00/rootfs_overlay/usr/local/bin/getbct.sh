#!/bin/sh

DEVICE=$(lsblk -o NAME |grep boot0)

dd if="/dev/$DEVICE" of="/boot/paz00.bct" bs=4080 count=1
