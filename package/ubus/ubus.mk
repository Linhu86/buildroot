################################################################################
#
# UBUS
#
################################################################################

UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
UBUS_SITE = git://nbd.name/luci2/ubus.git
UBUS_LICENSE = LGPLv2.1
UBUS_DEPENDENCIES = json-c libubox
UBUS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_LUA_5_1),y)
UBUS_DEPENDENCIES += lua
UBUS_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include \
	-DBUILD_LUA=ON
else
UBUS_CONF_OPTS += -DBUILD_LUA=OFF
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
UBUS_DEPENDENCIES +=  systemd
UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
else
UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
endif

define UBUS_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(BUILD_DIR)/ubus-$(UBUS_VERSION)/libubus.so $(STAGING_DIR)/usr/lib/libubus.so
endef

$(eval $(cmake-package))
