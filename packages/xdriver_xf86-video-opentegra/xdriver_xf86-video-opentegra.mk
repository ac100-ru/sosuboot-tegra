################################################################################
#
# xdriver_xf86-video-opentegra
#
################################################################################

XDRIVER_XF86_VIDEO_OPENTEGRA_VERSION = 29c7a7ea214ccdc05da97a7109c0f72f93bedb43
XDRIVER_XF86_VIDEO_OPENTEGRA_SITE = $(call github,grate-driver,xf86-video-opentegra,$(XDRIVER_XF86_VIDEO_OPENTEGRA_VERSION))
XDRIVER_XF86_VIDEO_OPENTEGRA_LICENSE = MIT
XDRIVER_XF86_VIDEO_OPENTEGRA_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_OPENTEGRA_DEPENDENCIES = \
        xserver_xorg-server \
        xproto_xproto \
        xproto_randrproto \
        xproto_videoproto \
        xproto_xf86driproto \
        libdrm
XDRIVER_XF86_VIDEO_OPENTEGRA_AUTORECONF = YES

# Autoreconf requires an existing m4 directory
define XDRIVER_XF86_VIDEO_OPENTEGRA_PATCH_M4
        mkdir -p $(@D)/m4
endef
XDRIVER_XF86_VIDEO_OPENTEGRA_POST_PATCH_HOOKS += XDRIVER_XF86_VIDEO_OPENTEGRA_PATCH_M4

$(eval $(autotools-package))
