# We don't need sensord by default. It rrecommends on lighttpd which builds php and mariadb
PACKAGECONFIG ?= ""

DEPENDS = " \
    bison-native \
    flex-native \
    virtual/libiconv \
"

RDEPENDS_${PN}_remove = "${PN}-sensord"
RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)}"

SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS_${PN}-fancontrol = "lmsensors-config-fancontrol bash"

FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${INIT_D_DIR}/fancontrol ${systemd_unitdir}/system/fancontrol.service"
