FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://hwmon.patch"

NAMES = " \
        i2c@1e78a000/i2c-bus@80/tmp75@49 \
        i2c@1e78a000/i2c-bus@140/occ-hwmon@50 \
        i2c@1e78a000/i2c-bus@180/occ-hwmon@51 \
        i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56 \
        i2c@1e78a000/i2c-bus@300/occ-hwmon@57 \
        i2c@1e78a000/i2c-bus@400/rtc@68 \
        i2c@1e78a000/i2c-bus@440/w83795g@2f \
        "
ITEMSFMT = "ahb/apb/{0}.conf"

ITEMS = "${@compose_list(d, 'ITEMSFMT', 'NAMES')}"

ENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN} += "${@compose_list(d, 'ENVS', 'ITEMS')}"
