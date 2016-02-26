################################################################################
#
# makeself
#
################################################################################

MAKESELF_VERSION = release-2.2.0
MAKESELF_SITE = $(call github,megastep,makeself,$(MAKESELF_VERSION))
MAKESELF_LICENSE = GPLv2
MAKESELF_LICENSE_FILES = COPYING

define HOST_MAKESELF_INSTALL_CMDS
        $(INSTALL) -D -m 755 $(@D)/makeself.sh $(HOST_DIR)/usr/bin/makeself.sh
        $(INSTALL) -D -m 755 $(@D)/makeself-header.sh $(HOST_DIR)/usr/bin/makeself-header.sh
endef

$(eval $(host-generic-package))
