FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://occ-control.patch"

EXTRA_OECONF_append = " --enable-i2c-occ"
