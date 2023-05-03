SUMMARY = "System initialization program"
HOMEPAGE = "https://github.com/phytec/partup"

LICENSE = "GPL-3.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"

PARTUP_ARCH_armv7a = "arm"
PARTUP_ARCH_aarch64 = "arm64"
PARTUP_ARCH_x86-64 = "amd64"

SRC_URI = "https://github.com/phytec/partup/releases/download/v${PV}/${BPN}-v${PV}-${PARTUP_ARCH}"
python do_fetch_prepend() {
    sums = {
        'arm': '1654ebcae384a1fe5c4ada051b720faef78f1700878dcfdfb73975de42fcd975',
        'arm64': '3340faa904776678905830ca9b70ef7527a6818905376cfe01614ba8eaa83a48',
        'amd64': '3ba2ef525ff510db5e4a6ee1c91a664542b81674474c35666ef456c2f0ee231b'
    }
    d.setVarFlag('SRC_URI', 'sha256sum', sums[d.getVar('PARTUP_ARCH')])
}

UPSTREAM_CHECK_URI = "https://github.com/phytec/partup/releases"

DEPENDS = "libyaml parted"
RDEPENDS_${PN} += " \
    tar \
    e2fsprogs-resize2fs \
    e2fsprogs-mke2fs \
    dosfstools \
    util-linux-sfdisk \
    util-linux-lsblk \
    util-linux-mount \
"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/${BPN}-v${PV}-${PARTUP_ARCH} ${D}${bindir}/${BPN}
}
