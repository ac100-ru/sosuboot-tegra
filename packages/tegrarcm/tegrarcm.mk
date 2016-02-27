################################################################################
#
# tegrarcm
#
################################################################################

TEGRARCM_VERSION = 1.7
TEGRARCM_SOURCE = v$(TEGRARCM_VERSION).tar.gz
TEGRARCM_SITE = https://github.com/NVIDIA/tegrarcm/archive
TEGRARCM_LICENSE = NVIDIA Software License
TEGRARCM_LICENSE_FILE = LICENSE
TEGRARCM_AUTORECONF = YES
HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf

$(eval $(host-autotools-package))
