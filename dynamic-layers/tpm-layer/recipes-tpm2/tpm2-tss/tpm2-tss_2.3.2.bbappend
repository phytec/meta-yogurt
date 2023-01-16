inherit useradd

USERADD_PACKAGES = "${PN}"
GROUPADD_PARAM_${PN} = "--system tss"
USERADD_PARAM_${PN} = "--system -M -d /var/lib/tpm -s /bin/false -g tss tss"
