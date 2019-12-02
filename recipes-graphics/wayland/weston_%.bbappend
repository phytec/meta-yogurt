do_install_append() {
        # distribute weston.ini in a machine specific recipe
	rm -f ${D}${sysconfdir}/xdg/weston/weston.ini
}

RDEPENDS_${PN} += "weston-machine-units"
