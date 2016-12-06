SUMMARY = "Gstreamer pluging for VITA 1300 Sensor image data conversion"
DESCRIPTION = "Gstreamer plugin using the VITA 1300 Sensor image data conversion library"
SECTION = "multimedia"
HOMEPAGE = "https://git.phytec.de/gst-vita-1300-remapper/"

# TODO Fix licence in source code
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=e431e272f5b8a6a4f948a910812f235e"

BRANCH = "master"
SRC_URI = "git://git.phytec.de/gst-vita-1300-remapper;branch=${BRANCH}"

S = "${WORKDIR}/git"

# NOTE: Keep sha1sum in sync with recipe version and git tag
SRCREV = "39aad321bf969f7b834709634600e67433904cf9"
PV = "0.2+git${SRCPV}"

PR = "r0"

inherit pkgconfig autotools

DEPENDS += "vita-1300-remapper gstreamer1.0-plugins-base gstreamer1.0"

FILES_${PN} += "${libdir}/gstreamer-*/*.so"
FILES_${PN}-dbg += "${libdir}/gstreamer-*/.debug"
