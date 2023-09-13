FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-psplash-Change-colors-to-PHYTEC-palette.patch \
    file://psplash-bar.png \
"

SPLASH_IMAGES = "file://psplash-poky.png;outsuffix=default"

do_configure_prepend() {
    cp ${WORKDIR}/*.png ${S}/base-images
}
