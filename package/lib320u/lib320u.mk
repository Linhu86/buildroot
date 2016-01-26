################################################################################
#
# lib320u
#
################################################################################
LIB320U_VERSION = 1.0
LIB320U_SOURCE =
LIB320U_SITE =
LIB320U_INSTALL_STAGING = YES
# Static library only, nothing to install on target
LIB320U_INSTALL_TARGET = NO

LIB320U_NAME = lib320u
LIB320U_PATH = $(TOPDIR)/package/$(LIB320U_NAME)

LIB320U_CFLAGS =
LIB320U_LDFLAGS =

#source files
LIB320U_SOURCEFILES = $(LIB320U_PATH)/src/lib320u.c

# Include directories
LIB320U_INCLUDEDIRS = $(LIB320U_PATH)/inc

# Definitions 
LIB320U_DEFINITIONS =

# Library dependency
LIB320U_LIBRARIES :=-lrt

########################################################
########           component processing ################
########           DO NOT MODIFY FROM HERE ########################
########################################################

LIB320U_OBJ :=  $(patsubst %.c,%.o,$(LIB320U_SOURCEFILES)) 

#process include directories
LIB320U_CFLAGS += $(sort $(strip $(addprefix -I,$(LIB320U_INCLUDEDIRS)  ) ) )
#process compiling switches / definitions
LIB320U_CFLAGS += $(sort $(strip $(addprefix -D,$(LIB320U_DEFINITIONS)  ) ) )
#process library dependency.
LIB320U_LDFLAGS += $(PROJECT_LIBRARIES)

define LIB320U_BUILD_CMDS
	$(TARGET_CC) $(LIB320U_CFLAGS) -c $(LIB320U_SOURCEFILES) -o $(LIB320U_OBJ) $(LIB320U_LDFLAGS)
	$(TARGET_AR) cru $(LIB320U_PATH)/$(LIB320U_NAME).a $(LIB320U_OBJ)
	$(TARGET_RANLIB) $(LIB320U_PATH)/$(LIB320U_NAME).a
endef

define LIB320U_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(LIB320U_PATH)/$(LIB320U_NAME).a $(STAGING_DIR)/usr/lib/$(LIB320U_NAME).a
    $(INSTALL) -D -m 0644 $(LIB320U_PATH)/inc/lib320u.h $(TARGET_DIR)/usr/include/lib320u.h
endef

$(eval $(generic-package))

