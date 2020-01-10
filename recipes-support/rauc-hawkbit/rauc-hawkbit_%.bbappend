FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://0001-ddi-client.py-remove-extra-between-host-and-api_path.patch \
    file://config.cfg \
"


do_patch_append() {
    bb.note("copying config.cfg from meta layer to source dir")
    import shutil
    src = d.getVar('WORKDIR') + "/config.cfg"
    dst = d.getVar('S') + "/rauc_hawkbit/config.cfg"
    shutil.copyfile(src, dst)
}
