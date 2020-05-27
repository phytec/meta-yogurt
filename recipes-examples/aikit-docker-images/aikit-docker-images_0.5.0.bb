# Copyright (C) 2019 Martin Schwan <m.schwan@phytec.de>
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Preinstallation of Docker images for the AI-kit"
HOMEPAGE = "https://www.phytec.de"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    ftp://ftp.phytec.de/pub/Software/Linux/BSP-Yocto-IoTEdge/aikit-docker-images/${PN}-${PV}-${TARGET_ARCH}.tar.gz;unpack=false \
"

# Default TARGET_ARCH is assumed to be "arm"
SRC_URI[md5sum] = "${@bb.utils.contains('TARGET_ARCH', 'aarch64', \
    'ea9de55789ca440ce7c06135d0cdf58f', \
    'c7b59f188a7a41a4eb350d7180ccf1ee', d)}"
SRC_URI[sha256sum] = "${@bb.utils.contains('TARGET_ARCH', 'aarch64', \
    '384f717ad39e5fe19e64adfcba943c8d4336b806ed1ad8277c60d6a261042b54', \
    '4fc37c50238a544faa45681f983e830a29393510a32944a86af4c0e4a7d47785', d)}"

EXCLUDE_FROM_SHLIBS = "1"
INHIBIT_DEFAULT_DEPS = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
INHIBIT_PACKAGE_STRIP = "1"
POPULATESYSROOTDEPS = ""

DEPENDS = "virtual/fakeroot-native"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

PREFIX = "${localstatedir}/lib"

fakeroot do_install () {
    mkdir -p ${D}${PREFIX}
    tar --no-same-owner -xpf ${WORKDIR}/${PN}-${PV}-${TARGET_ARCH}.tar.gz -C ${D}${PREFIX}
}

FILES_${PN} = " \
    ${localstatedir}/lib/docker \
"
RDEPENDS_${PN} = "iotedge-cli iotedge-daemon docker"
INSANE_SKIP_${PN} = " \
    already-stripped \
    staticdev \
    dev-so \
    ldflags \
    arch \
    infodir \
    textrel \
    file-rdeps \
"
