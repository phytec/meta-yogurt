SUMMARY = "Machine specific weston units"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=b97a012949927931feb7793eee5ed924"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI = "\
    file://weston.ini \
"

do_install() {
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston
}

FILES_${PN} += "${sysconfdir}/xdg/weston"
