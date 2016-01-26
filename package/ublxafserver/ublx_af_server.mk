################################################################################
#
# ublxafserver
#
################################################################################
UBLXAFSERVER_VERSION = 1.0
UBLXAFSERVER_SOURCE =
UBLXAFSERVER_SITE =
UBLXAFSERVER_DEPENDENCIES = ubus lib320u

UBLXAFSERVER_CFLAGS =
UBLXAFSERVER_LDFLAGS = 

UBLXAFSERVER_NAME = ublxafserver
UBLXAFSERVER_PATH = $(TOPDIR)/package/$(UBLXAFSERVER_NAME)

#source files
UBLXAFSERVER_SOURCEFILES = $(UBLXAFSERVER_PATH)/src/ublx_af_server.c \
                           $(UBLXAFSERVER_PATH)/src/ublx_af_api.c

# Include directories
UBLXAFSERVER_INCLUDEDIRS = $(TARGET_DIR)/usr/include \
                           $(UBLXAFSERVER_PATH)/inc

# Definitions
UBLXAFSERVER_DEFINITIONS =

# Library dependency
UBLXAFSERVER_LIBRARIES :=-lrt -l320u -lubox -lblobmsg_json -lubus

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

#process include directories
UBLXAFSERVER_CFLAGS += $(sort $(strip $(addprefix -I,$(UBLXAFSERVER_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
UBLXAFSERVER_CFLAGS += $(sort $(strip $(addprefix -D,$(UBLXAFSERVER_DEFINITIONS)  ) ) )
#process library dependency.
UBLXAFSERVER_LDFLAGS += $(UBLXAFSERVER_LIBRARIES)

define UBLXAFSERVER_BUILD_CMDS
	$(TARGET_CC) $(UBLXAFSERVER_CFLAGS) -o $(@D)/$(UBLXAFSERVER_NAME) $(UBLXAFSERVER_SOURCEFILES) $(UBLXAFSERVER_LDFLAGS)
endef

define UBLXAFSERVER_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/$(UBLXAFSERVER_NAME) $(TARGET_DIR)/usr/bin/$(UBLXAFSERVER_NAME)
endef

$(eval $(generic-package))

