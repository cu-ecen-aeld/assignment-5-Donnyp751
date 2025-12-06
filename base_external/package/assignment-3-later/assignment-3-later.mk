
##############################################################
#
# ASSIGNMENT-3-LATER
#
##############################################################

ASSIGNMENT_3_LATER_VERSION = 16a60a0e1d4ae800dfa567ab08034bd7164f6890
ASSIGNMENT_3_LATER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Donnyp751.git
ASSIGNMENT_3_LATER_SITE_METHOD = git
ASSIGNMENT_3_LATER_GIT_SUBMODULES = YES

# Build kernel module from aesd-char-driver directory
ASSIGNMENT_3_LATER_MODULE_SUBDIRS = aesd-char-driver

# Build the aesdsocket server (clean first to remove any host-built binaries)
define ASSIGNMENT_3_LATER_BUILD_CMDS
	$(MAKE) -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Install aesdsocket binary and init script
# Install aesdchar_load and aesdchar_unload scripts
define ASSIGNMENT_3_LATER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
