################################################################################
#
# android-installer
#
################################################################################

ANDROID_INSTALLER_VERSION = v1
ANDROID_INSTALLER_GITHUB_VERSION = ng
ANDROID_INSTALLER_SITE = $(call github,ac100-ru,android-installer,$(ANDROID_INSTALLER_GITHUB_VERSION))
ANDROID_INSTALLER_LICENSE = GPLv2
ANDROID_INSTALLER_LICENSE_FILES = LICENSE

define ANDROID_INSTALLER_INSTALL_TARGET_CMDS
       mkdir -p $(TARGET_DIR)/usr/local/bin
       $(INSTALL) -m 0755 $(@D)/installer $(TARGET_DIR)/usr/local/bin/installer
endef

$(eval $(generic-package))
