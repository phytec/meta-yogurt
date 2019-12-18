FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
           file://0001-ext-opencv-gstgrabcut.cpp-do-not-include-imgproc_c.h.patch \
"

PACKAGECONFIG_append = " kms"
PACKAGECONFIG_append_mx6 = " opencv zbar"
PACKAGECONFIG_append_mx6ul = " opencv zbar"
PACKAGECONFIG_append_mx8m = " opencv zbar"

PACKAGECONFIG[zbar] = "--enable-zbar,--disable-zbar,zbar"

EXTRA_OECONF_remove = "--disable-zbar"
