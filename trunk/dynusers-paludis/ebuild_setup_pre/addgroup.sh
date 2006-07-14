#!/bin/sh
# Paludis hook for dynusers' addgroup.sh script

prefix=@prefix@
datarootdir=@datarootdir@
scriptdir=@datadir@/@PACKAGE@

for i in ${ENEWGROUPS} ; do
	"${scriptdir}/addgroup.sh" "${i}" "${PF}" "${USERLAND}"
done
