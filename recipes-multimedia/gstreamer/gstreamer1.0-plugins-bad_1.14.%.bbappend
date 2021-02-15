FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
           file://0001-ext-opencv-gstgrabcut.cpp-do-not-include-imgproc_c.h.patch \
"
