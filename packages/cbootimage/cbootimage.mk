################################################################################
#
# cbootimage
#
################################################################################

CBOOTIMAGE_VERSION = v1.7
CBOOTIMAGE_SITE = https://github.com/NVIDIA/cbootimage.git
CBOOTIMAGE_SITE_METHOD = git
CBOOTIMAGE_LICENSE = GPLv2
CBOOTIMAGE_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
