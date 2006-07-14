#!/bin/sh
# Paludis hook for dynusers' adduser.sh script

prefix=@prefix@
datarootdir=@datarootdir@
scriptdir=@datadir@/@PACKAGE@

for i in ${ENEWUSERS} ; do
	"${scriptdir}/adduser.sh" "${i}" "${PF}" "${USERLAND}"
done
