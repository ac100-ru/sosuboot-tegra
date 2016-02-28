#!/bin/sh

(cd /boot && exec cbootimage --debug -o0x800c0075 "/boot/paz00.cfg" "/boot/paz00.bct.new")
