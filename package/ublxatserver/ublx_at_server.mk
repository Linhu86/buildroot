################################################################################
#
# ublxatserver
#
################################################################################
UBLXATSERVER_VERSION = 1.0
UBLXATSERVER_SOURCE =
UBLXATSERVER_SITE =
UBLXATSERVER_DEPENDENCIES = ubus lib320u

UBLXATSERVER_NAME = ublxatserver
UBLXATSERVER_PATH = $(TOPDIR)/package/$(UBLXATSERVER_NAME)

UBLXATSERVER_CFLAGS =
UBLXATSERVER_LDFLAGS =

#source files
UBLXATSERVER_SOURCEFILES = $(UBLXATSERVER_PATH)/src/ublx_at_server.c \
                       $(UBLXATSERVER_PATH)/src/ublx_at_api.c

# Include directories
UBLXATSERVER_INCLUDEDIRS = $(TARGET_DIR)/usr/include \
                           $(UBLXATSERVER_PATH)/inc

# Definitions
UBLXATSERVER_DEFINITIONS =

# Library dependency
UBLXATSERVER_LIBRARIES :=-lrt -l320u -lubox -lblobmsg_json -lubus

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

#process include directories
UBLXATSERVER_CFLAGS += $(sort $(strip $(addprefix -I,$(UBLXATSERVER_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
UBLXATSERVER_CFLAGS += $(sort $(strip $(addprefix -D,$(UBLXATSERVER_DEFINITIONS)  ) ) )
#process library dependency.
UBLXATSERVER_LDFLAGS += $(UBLXATSERVER_LIBRARIES)

define UBLXATSERVER_BUILD_CMDS
	$(TARGET_CC) $(UBLXATSERVER_CFLAGS) -o $(@D)/$(UBLXATSERVER_NAME) $(UBLXATSERVER_SOURCEFILES) $(UBLXATSERVER_LDFLAGS)
endef

define UBLXATSERVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(UBLXATSERVER_NAME) $(TARGET_DIR)/usr/sbin/$(UBLXATSERVER_NAME)
endef

$(eval $(generic-package))

