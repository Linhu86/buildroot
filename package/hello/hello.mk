################################################################################
#
# hello
#
################################################################################
HELLO_VERSION = 1.0
HELLO_SOURCE =
HELLO_SITE =
HELLO_DEPENDENCIES = lttng-libust

HELLO_NAME = hello
HELLO_PATH = $(TOPDIR)/package/$(HELLO_NAME)

HELLO_CFLAGS =
HELLO_LDFLAGS =

#source files
HELLO_SOURCEFILES = $(HELLO_PATH)/src/hello.c \
                    $(HELLO_PATH)/src/tp.c

# Include directories
HELLO_INCLUDEDIRS = $(HELLO_DIR)/usr/include \
                         inc

# Definitions 
HELLO_DEFINITIONS =

# Library dependency
HELLO_LIBRARIES := -ldl -llttng-ust

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

#process include directories
HELLO_CFLAGS += $(sort $(strip $(addprefix -I,$(HELLO_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
HELLO_CFLAGS += $(sort $(strip $(addprefix -D,$(HELLO_DEFINITIONS)  ) ) )
#process library dependency.
HELLO_LDFLAGS += $(HELLO_LIBRARIES)

define UBLXAFTEST_BUILD_CMDS
	$(TARGET_CC) $(HELLO_CFLAGS) -o $(@D)/$(HELLO_NAME) $(HELLO_SOURCEFILES) $(HELLO_LDFLAGS)
endef

define UBLXAFTEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(HELLO_NAME) $(TARGET_DIR)/usr/sbin/$(HELLO_NAME)
endef

$(eval $(generic-package))

