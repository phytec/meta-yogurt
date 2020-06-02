# We don't need sensord by default. It rrecommends on lighttpd which builds php and mariadb
PACKAGECONFIG ?= ""

DEPENDS = " \
    bison-native \
    flex-native \
    virtual/libiconv \
"

RDEPENDS_${PN}_remove = "${PN}-sensord"
RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)}"
