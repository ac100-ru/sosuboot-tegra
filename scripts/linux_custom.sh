#!/bin/sh
LINUX_BRANCH=mainline
LINUX_BANNER=https://www.kernel.org/finger_banner
LINUX_VERSION=$(wget -qO- $LINUX_BANNER | awk -v pattern=$LINUX_BRANCH 'match($0, pattern) {print $(NF)}' |head -1)

sed -e 's,@LINUX_VERSION,'"$LINUX_VERSION"',' ../configs/tegra20-paz00_temp_defconfig > ../configs/tegra20-paz00_mainline_defconfig
