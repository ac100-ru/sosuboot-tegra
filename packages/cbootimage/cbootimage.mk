################################################################################
#
# cbootimage
#
################################################################################

# Stick with git snapshot as latest release misses bugfixes for signing
CBOOTIMAGE_VERSION = e7d840c
CBOOTIMAGE_SITE = https://github.com/NVIDIA/cbootimage.git
CBOOTIMAGE_SITE_METHOD = git
CBOOTIMAGE_LICENSE = GPLv2
CBOOTIMAGE_AUTORECONF = YES

$(eval $(autotools-package))
