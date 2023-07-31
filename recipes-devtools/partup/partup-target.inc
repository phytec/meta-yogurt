DEPENDS = " \
    glib-2.0 \
    libyaml \
    parted \
    util-linux \
"
RDEPENDS_${PN} += " \
    dosfstools \
    e2fsprogs \
    squashfs-tools \
    tar \
    util-linux-sfdisk \
"
