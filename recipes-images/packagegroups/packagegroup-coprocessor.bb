DESCRIPTION = "Demos & Examples for Co-Processors such as PRU/R5/M4 Cores."
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

# Include AM57 examples from meta-ti
RDEPENDS_${PN}_append_am57xx = " \
    ti-ipc-rtos-fw \
    ti-ipc-examples-linux \
    ti-ipc-test \
    pru-icss \
    uio-test-pruss \
    uio-module-drv-test \
"

# Include AM62/AM64 examples from meta-ti
RDEPENDS_${PN}_append_k3 = " \
    ti-rtos-firmware \
    pru-icss \
    ti-rpmsg-char \
    ti-rpmsg-char-examples \
"

RDEPENDS_${PN}_remove_am62axx = "pru-icss"
RDEPENDS_${PN}_append_am62axx = " cnm-wave-fw"
