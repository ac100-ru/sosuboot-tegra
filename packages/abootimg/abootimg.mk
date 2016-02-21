################################################################################
#
# abootimg
#
################################################################################

# Stick with git snapshot as latest release misses bugfixes for signing
ABOOTIMG_VERSION = v0.6
ABOOTIMG_GITHUB_VERSION = master
ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_GITHUB_VERSION))
ABOOTIMG_LICENSE = GPLv2
ABOOTIMG_LICENSE_FILES = LICENSE
ABOOTIMG_DEPENDENCIES = util-linux

define ABOOTIMG_BUILD_CMDS
       echo "#define VERSION_STR \"$(ABOOTIMG_VERSION)\"" > $(@D)/version.h
       $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS=-Os -C $(@D) all
endef

define ABOOTIMG_INSTALL_TARGET_CMDS
       $(INSTALL) -m 0755 $(@D)/abootimg $(TARGET_DIR)/usr/bin
       $(INSTALL) -m 0755 $(@D)/abootimg-pack-initrd $(TARGET_DIR)/usr/bin/abootimg-pack-initrd
       $(INSTALL) -m 0755 $(@D)/abootimg-unpack-initrd $(TARGET_DIR)/usr/bin/abootimg-unpack-initrd
endef

$(eval $(generic-package))
