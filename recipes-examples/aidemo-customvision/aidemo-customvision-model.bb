SUMMARY = "Custom Vision model runner"
HOMEPAGE = "https://www.phytec.de"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = " \
    file://${PN}.service \
"

inherit systemd

SYSTEMD_SERVICE_${PN} = "${PN}.service"

do_install () {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_system_unitdir}
}

RDEPENDS_${PN} += " \
    aikit-docker-images \
"
FILES_${PN} += " \
    ${systemd_system_unitdir} \
"
