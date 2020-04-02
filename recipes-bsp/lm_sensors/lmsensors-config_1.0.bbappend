PACKAGECONFIG ??= ""
PACKAGECONFIG[sensord] = ",,"

do_install() {
    # Install fancontrol configuration file
    install -d ${D}${sysconfdir}/sysconfig
    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/sensord ${D}${sysconfdir}/sysconfig
    # Install libsensors configuration file
    install -d ${D}${sysconfdir}/sensors.d
    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d

    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
        # Install sensord configuration file
        install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}

        # Install sensord.cgi script and create world-writable
        # web-accessible sensord directory
        install -d ${D}/www/pages/cgi-bin
        install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
        install -d -m a=rwxs ${D}/www/pages/sensord
    fi
}

PACKAGES_remove = "${PN}-sensord"
PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)}"

PACKAGES_remove = "${PN}-cgi"
PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-cgi', '', d)}"
