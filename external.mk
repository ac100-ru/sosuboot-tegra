include $(sort $(wildcard $(BR2_EXTERNAL_SOSUBOOT_TEGRA_PATH)/packages/*/*.mk))

# Add global patches folder
BR2_GLOBAL_PATCH_DIR += "$(BR2_EXTERNAL_SOSUBOOT_TEGRA_PATH)/patches"
