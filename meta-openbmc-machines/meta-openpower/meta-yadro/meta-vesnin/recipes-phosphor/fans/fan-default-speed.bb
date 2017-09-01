SUMMARY = "Set fans to a default speed"
DESCRIPTION = "Set fans to a default speed"
PR = "r1"

inherit obmc-phosphor-systemd
inherit obmc-phosphor-license

RDEPENDS_${PN} += "i2c-tools"

S = "${WORKDIR}"
SRC_URI += "file://fan-default-speed.sh"

do_install() {
        install -d ${D}${bindir}
        install -m 0755 ${WORKDIR}/fan-default-speed.sh ${D}${bindir}/fan-default-speed.sh
}

TMPL = "fan-default-speed@.service"
INSTFMT = "fan-default-speed@{0}.service"
TGTFMT = "obmc-chassis-poweron@{0}.target"
FMT = "../${TMPL}:${TGTFMT}.wants/${INSTFMT}"

SYSTEMD_SERVICE_${PN} += "${TMPL}"
SYSTEMD_LINK_${PN} += "${@compose_list(d, 'FMT', 'OBMC_CHASSIS_INSTANCES')}"
