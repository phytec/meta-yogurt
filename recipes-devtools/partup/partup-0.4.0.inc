PARTUP_ARCH_armv7ve = "arm"
PARTUP_ARCH_armv7a = "arm"
PARTUP_ARCH_aarch64 = "arm64"
PARTUP_ARCH_x86-64 = "amd64"

SRC_URI = "https://github.com/phytec/partup/releases/download/v${PV}/${BPN}-v${PV}-${PARTUP_ARCH}"
python do_fetch_prepend() {
    sums = {
        'arm': 'bc29c69435c994dae841564f6eb1eb04eeb9b5bf563ee353d5b42f050dbbe4ee',
        'arm64': '99df7621a2c76b9c23f78033ea77fc8c21849855632efe93704b18dc60485e89',
        'amd64': '65dd5f80bf6878aa3bd961d3692582ee8feb22c58832f7a4b337fb2153a976da'
    }
    d.setVarFlag('SRC_URI', 'sha256sum', sums[d.getVar('PARTUP_ARCH')])
}

UPSTREAM_CHECK_URI = "https://github.com/phytec/partup/releases"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/${BPN}-v${PV}-${PARTUP_ARCH} ${D}${bindir}/${BPN}
}
