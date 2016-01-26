################################################################################
#
# ublxatcmdtest
#
################################################################################
UBLXATCMDTEST_VERSION = 1.0
UBLXATCMDTEST_SOURCE =
UBLXATCMDTEST_SITE =
UBLXATSERVER_DEPENDENCIES = lib320u

UBLXATCMDTEST_NAME = ublxatcmdtest
UBLXATCMDTEST_PATH = $(TOPDIR)/package/$(UBLXATCMDTEST_NAME)

UBLXATCMDTEST_CFLAGS =
UBLXATCMDTEST_LDFLAGS =

#source files
UBLXATCMDTEST_SOURCEFILES = $(UBLXATCMDTEST_PATH)/src/ublx_at_cmd_test.c

# Include directories
UBLXATCMDTEST_INCLUDEDIRS = $(TARGET_DIR)/usr/include

# Definitions 
UBLXATCMDTEST_DEFINITIONS =

# Library dependency
UBLXATCMDTEST_LIBRARIES :=-lrt -l320u -lubus

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

UBLXATCMDTEST_OBJ :=  $(patsubst %.c,%.o,$(UBLXATCMDTEST_SOURCEFILES)) 

#process include directories
UBLXATCMDTEST_CFLAGS += $(sort $(strip $(addprefix -I,$(UBLXATCMDTEST_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
UBLXATCMDTEST_CFLAGS += $(sort $(strip $(addprefix -D,$(UBLXATCMDTEST_DEFINITIONS)  ) ) )
#process library dependency.
UBLXATCMDTEST_LDFLAGS += $(UBLXATCMDTEST_LIBRARIES)

define UBLXATCMDTEST_BUILD_CMDS
	$(TARGET_CC) $(UBLXATCMDTEST_CFLAGS) -o $(@D)/$(UBLXATCMDTEST_NAME) $(UBLXATCMDTEST_SOURCEFILES) $(UBLXATCMDTEST_LDFLAGS)
endef

define UBLXATCMDTEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(UBLXATCMDTEST_NAME) $(TARGET_DIR)/usr/sbin/$(UBLXATCMDTEST_NAME)
endef

$(eval $(generic-package))

