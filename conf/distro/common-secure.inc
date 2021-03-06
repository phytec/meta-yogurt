#add secure boot to the Distro
DISTRO_FEATURES += "secureboot"
DISTRO_FEATURES_NATIVE += "secureboot"
DISTRO_FEATURES_NATIVESDK += "secureboot"

#kernel-modsign
DISTRO_FEATURES += "kernelmodsign"
DISTRO_FEATURES_NATIVE += "kernelmodsign"
DISTRO_FEATURES_NATIVESDK += "kernelmodsign"

#add protection shield level
#shieldlow - shieldmedium - shieldhigh
DISTRO_FEATURES += "protectionshield"
PROTECTION_SHIELD_LEVEL = "shieldlow"
#user root password for shield low and midle
#password quality decide about the protection level
PROTECTION_SHIELD_ROOT_PASSWORD ?= 'root'

#add class secureboot for signing Bootloader and FIT-Image
INHERIT += "secureboot"
