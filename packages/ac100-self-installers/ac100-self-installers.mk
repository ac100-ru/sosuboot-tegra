################################################################################
#
# ac100-self-installers
#
################################################################################

AC100_SELF_INSTALLERS_VERSION = v1
AC100_SELF_INSTALLERS_GITHUB_VERSION = ng
AC100_SELF_INSTALLERS_SITE = $(call github,Stuw,ac100-self-installers,$(AC100_SELF_INSTALLERS_GITHUB_VERSION))
AC100_SELF_INSTALLERS_LICENSE = GPLv3
AC100_SELF_INSTALLERS_LICENSE_FILES = COPYING
AC100_SELF_INSTALLERS_DEPENDENCIES = host-makeself

define AC100_SELF_INSTALLERS_BUILD_CMDS
       $(HOST_DIR)/usr/bin/makeself.sh $(@D)/switch-to-uboot $(@D)/paz00-switch-to-uboot "AC100 uboot+gpt installer" ./main.sh
       $(HOST_DIR)/usr/bin/makeself.sh $(@D)/partitioner $(@D)/paz00-partitioner "AC100 uboot Android + Linux partitioner" ./main.sh
endef

define AC100_SELF_INSTALLERS_INSTALL_TARGET_CMDS
       mkdir -p $(TARGET_DIR)/usr/local/bin
       $(INSTALL) -m 0755 $(@D)/paz00-switch-to-uboot $(TARGET_DIR)/usr/local/bin/switch-to-uboot
       $(INSTALL) -m 0755 $(@D)/paz00-partitioner $(TARGET_DIR)/usr/local/bin/partitioner
endef

$(eval $(generic-package))
