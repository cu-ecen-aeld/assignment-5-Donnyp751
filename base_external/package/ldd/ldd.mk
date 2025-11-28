
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = d8147398d5bcd786d5a249c8e82c5973ceb13db1
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Donnyp751.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# Build kernel modules
LDD_MODULE_SUBDIRS = misc-modules scull

$(eval $(kernel-module))
$(eval $(generic-package))
