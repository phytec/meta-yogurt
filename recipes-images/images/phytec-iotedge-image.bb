require recipes-images/images/phytec-headless-image.bb

SUMMARY = "Phytec's Azure IoT Edge image"
DESCRIPTIION = "We use chrony to sync the time for the gateway and to the nodes"
LICENSE = "MIT"

IMAGE_INSTALL = " \
    packagegroup-base \
    packagegroup-gstreamer \
    \
    openssh \
    chrony \
    chronyc \
    iproute2 \
    \
    qtwayland \
    qtwayland-plugins \
    weston \
    weston-init \
    \
    docker \
    iotedge-cli \
    iotedge-daemon \
    aidemo-customvision-model \
    aidemo-customvision-demo \
"
