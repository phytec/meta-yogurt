FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://0001-v4l2object-Update-formats-table.patch \
    file://0002-Support-more-bayer-formats.patch \
    file://0003-Allow-to-access-v4l2-in-raw-mode.patch \
    file://0004-v4l2-modify-GstV4l2VideoDecCData-to-GstV4l2VideoCDat.patch \
    file://0005-v4l2-move-GstVideoCData-to-v4l2-utils.h.patch \
    file://0006-v4l2-add-v4l2-video-encoder.patch \
    file://0007-v4l2videoenc-set-width-height-of-output-caps.patch \
    file://0008-v4l2videoenc-build-with-std-gnu99.patch \
    file://0009-v4l2videoenc-Don-t-unlock-the-stream-lock-twice.patch \
    file://0010-v4l2videoenc-fix-warning-unused-variable-structure.patch \
"
