FILESEXTRAPATHS_prepend := "${THISDIR}/python3:"

SRC_URI_append_class-native += " \
        file://0001-Don-t-search-system-for-headers-libraries.patch \
        "
