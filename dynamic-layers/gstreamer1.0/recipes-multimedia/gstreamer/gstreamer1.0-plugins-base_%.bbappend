FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "\
  file://grayxx-base.patch \
  file://0001-Add-GBM_CFLAGS-and-define-EGL_PLATFORM_GBM_MESA.patch \
"
