FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://weston.ini"

INI_UNCOMMENT_ASSIGNMENTS_remove_mx8mq = "repaint-window=16"

INI_UNCOMMENT_ASSIGNMENTS_append_mx8mq = "drm-device=card0"

SRC_URI_append_mx8 = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland x11', 'file://weston.config', '', d)}"

SRC_URI_append_am57xx = " file://profile"

do_install_append_am57xx() {
    install -Dm0755 ${WORKDIR}/profile ${D}${sysconfdir}/profile.d/weston.sh
}

FILES_${PN}_append_am57xx += "${sysconfdir}/profile.d/weston.sh"
