# Copyright (C) 2014 Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Userlandtools for gstreamer and cameras"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = " \
    media-ctl \
    v4l-utils \
    gstreamer1.0 \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-base-tcp \
    gstreamer1.0-plugins-base-pango \
    gstreamer1.0-plugins-base-videorate \
    gstreamer1.0-plugins-base-videoscale \
    gstreamer1.0-plugins-base-videoconvert \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-good-jpeg \
    gstreamer1.0-plugins-good-isomp4 \
    gstreamer1.0-plugins-good-multifile \
    gstreamer1.0-plugins-good-video4linux2 \
    gstreamer1.0-plugins-bad-bayer \
    gstreamer1.0-plugins-bad-fbdevsink \
    gstreamer1.0-plugins-bad-videoparsersbad \
    gst-plugin-i2c \
    ${@bb.utils.contains("DISTRO_FEATURES", "vendor", "${PACKAGES_VENDOR}", "${PACKAGES_MAINLINE}", d)} \
"

PACKAGES_MAINLINE = ""
PACKAGES_MAINLINE_append_mx6 = " \
    bvtest \
    phytec-gstreamer-examples \
    phytec-v4l2-c-examples \
"

PACKAGES_VENDOR = ""
PACKAGES_VENDOR_append_mx6ul = " \
    gstreamer1.0-plugins-imx \
    phytec-gstreamer-examples-imx6ul \
    phytec-v4l2-c-examples-imx6ul\
"
