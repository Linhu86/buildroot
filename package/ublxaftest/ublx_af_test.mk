################################################################################
#
# ublxaftest
#
################################################################################
UBLXAFTEST_VERSION = 1.0
UBLXAFTEST_SOURCE =
UBLXAFTEST_SITE =
UBLXAFTEST_DEPENDENCIES = ubus lib320u

UBLXAFTEST_NAME = ublxaftest
UBLXAFTEST_PATH = $(TOPDIR)/package/$(UBLXAFTEST_NAME)

UBLXAFTEST_CFLAGS =
UBLXAFTEST_LDFLAGS =

#source files
UBLXAFTEST_SOURCEFILES = $(UBLXAFTEST_PATH)/src/ublx_af_test.c

# Include directories
UBLXAFTEST_INCLUDEDIRS = $(TARGET_DIR)/usr/include

# Definitions 
UBLXAFTEST_DEFINITIONS =

# Library dependency
UBLXAFTEST_LIBRARIES := -lubox -lblobmsg_json -lubus

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

#process include directories
UBLXAFTEST_CFLAGS += $(sort $(strip $(addprefix -I,$(UBLXAFTEST_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
UBLXAFTEST_CFLAGS += $(sort $(strip $(addprefix -D,$(UBLXAFTEST_DEFINITIONS)  ) ) )
#process library dependency.
UBLXAFTEST_LDFLAGS += $(UBLXAFTEST_LIBRARIES)

define UBLXAFTEST_BUILD_CMDS
	$(TARGET_CC) $(UBLXAFTEST_CFLAGS) -o $(@D)/$(UBLXAFTEST_NAME) $(UBLXAFTEST_SOURCEFILES) $(UBLXAFTEST_LDFLAGS)
endef

define UBLXAFTEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(UBLXAFTEST_NAME) $(TARGET_DIR)/usr/sbin/$(UBLXAFTEST_NAME)
endef

$(eval $(generic-package))

