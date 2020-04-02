DEPENDS = " \
    sysfsutils \
    bison-native \
    flex-native \
    virtual/libiconv \
"

PACKAGECONFIG ??= ""
PACKAGECONFIG[sensord] = "sensord,,rrdtool"

INITSCRIPT_PACKAGES = "\
    ${PN}-fancontrol \
    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
    "

SYSTEMD_PACKAGES = "\
    ${PN} \
    ${PN}-fancontrol \
    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
    "
SYSTEMD_SERVICE_${PN} = "lm_sensors.service"
SYSTEMD_SERVICE_${PN}-fancontrol = "fancontrol.service"
SYSTEMD_SERVICE_${PN}-sensord = "sensord.service"
SYSTEMD_AUTO_ENABLE = "enable"

FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/init.d/fancontrol ${systemd_unitdir}/system/fancontrol.service"

do_compile() {
    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
    # Respect LDFLAGS
    sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
    sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
                ${S}/lib/Module.mk
    oe_runmake user PROG_EXTRA="sensors ${PACKAGECONFIG_CONFARGS}"
}

do_install() {
    oe_runmake user_install DESTDIR=${D}
    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
        install -m 0755 ${S}/prog/sensord/sensord ${D}${sbindir}
        install -m 0644 ${S}/prog/sensord/sensord.8 ${D}${mandir}/man8
    fi

    # Install directory
    install -d ${D}${sysconfdir}/init.d

    # Install fancontrol init script
    install -m 0755 ${WORKDIR}/fancontrol.init \
        ${D}${sysconfdir}/init.d/fancontrol

    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
        # Install sensord init script
        install -m 0755 ${WORKDIR}/sensord.init ${D}${sysconfdir}/init.d/sensord
    fi

    # Install sensord service script
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${S}/prog/init/*.service ${D}${systemd_unitdir}/system
    if ! ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
        rm ${D}${systemd_system_unitdir}/sensord.service
    fi
}

ALLOW_EMPTY_${PN} = "1"
RDEPENDS_${PN} += " \
    ${PN}-libsensors \
    ${PN}-sensors \
    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
    ${PN}-fancontrol \
    ${PN}-sensorsdetect \
    ${PN}-sensorsconfconvert \
    ${PN}-pwmconfig \
    ${PN}-isatools \
"

RDEPENDS_${PN}-fancontrol = "lmsensors-config-fancontrol bash"
RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol bash"
PACKAGES_remove = "${PN}-sensord ${PN}-sensord-doc"
PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord ${PN}-sensord-doc', '', d)}"
