FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_am57xx += " \
        file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
        file://0004-weston-Fix-touch-screen-crash-issue.patch \
"
