#!/bin/sh
# Paludis hook for dynusers' addgroup.sh and adduser.sh scripts

prefix=@prefix@
datarootdir=@datarootdir@
scriptdir=@datadir@/@PACKAGE@

for i in ${ENEWGROUPS} ; do
	"${scriptdir}/addgroup.sh" "${i}" "${PF}" "${USERLAND}"
done

for i in ${ENEWUSERS} ; do
	"${scriptdir}/adduser.sh" "${i}" "${PF}" "${USERLAND}"
done
