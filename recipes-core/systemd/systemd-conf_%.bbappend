FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

inherit systemd

SRC_URI += " \
    file://10-watchdog.conf \
    file://10-eth0.network \
    file://10-eth1.network \
    file://10-eth2.network \
    file://90-dhcp-default.network \
    ${@bb.utils.contains("MACHINE_FEATURES", "can", "file://can0.service", "", d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", "can", "file://can1.service", "", d)} \
"

SRC_URI_append_mx6ul = " file://cpuidle-disable-state.rules"
SRC_URI_append_phyboard-izar-am68x-1 = " file://am68x-avs-voltage.service"

SYSTEMD_SERVICE_${PN} = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "can", "can0.service", "", d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", "can", "can1.service", "", d)} \
"

do_install_append() {
    install -d ${D}${systemd_unitdir}/network/
    for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.network); do
        install -m 0644 "$file" ${D}${systemd_unitdir}/network/
    done
    install -d ${D}${systemd_system_unitdir}/
    for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.service); do
        install -m 0644 "$file" ${D}${systemd_system_unitdir}/
    done

    [ -e ${WORKDIR}/10-watchdog.conf ] && \
      install -m 0644 ${WORKDIR}/10-watchdog.conf ${D}${systemd_unitdir}/system.conf.d/10-watchdog.conf

    if [ -e ${WORKDIR}/cpuidle-disable-state.rules ]; then
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${WORKDIR}/cpuidle-disable-state.rules ${D}${sysconfdir}/udev/rules.d/
    fi

    if [ -e ${WORKDIR}/am68x-avs-voltage.service ]; then
        install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
        install -m 0644 ${WORKDIR}/am68x-avs-voltage.service ${D}${sysconfdir}/systemd/system/
        ln -sf ../am68x-avs-voltage.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/am68x-avs-voltage.service
    fi

    rm -rf ${D}${systemd_unitdir}/network/wired.network
    rm -rf ${D}${systemd_unitdir}/network/80-wired.network
}

FILES_${PN} += "\
    ${systemd_system_unitdir} \
    ${sysconfdir}/udev/rules.d \
    ${sysconfdir}/systemd/system \
"
