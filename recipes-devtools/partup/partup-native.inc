inherit native

DEPENDS = " \
    glib-2.0-native \
    libyaml-native \
    parted-native \
    util-linux-native \
"
RDEPENDS_${PN} += " \
    dosfstools-native \
    e2fsprogs-native \
    squashfs-tools-native \
    tar-native \
    util-linux-sfdisk-native \
"
