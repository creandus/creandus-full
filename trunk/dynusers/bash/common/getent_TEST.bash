#!/bin/bash
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2

. "${SCRIPTDIR}/common/getent.bash" || exit 1

if [[ "${1}" == "--test" ]] ; then
	if [[ "`egetent passwd 0`" != "`egetent passwd root`" ]] ; then
		echo 'ERROR! egetent passwd 0 != egetent passwd root!' 1>&2
		exit 1
	fi
	echo 'egetent passwd 0 == egetent passwd root'

	if [[ "`egetent group 0`" != "`egetent group root`" ]] ; then
		echo 'ERROR! egetent group 0 != egetent group root!' 1>&2
		exit 1
	fi
	echo 'egetent group 0 == egetent group root'

	if [[ "`egetent passwd 10`" == "`egetent passwd root`" ]] ; then
		echo 'ERROR! egetent passwd 10 == egetent group root!' 1>&2
		exit 77
	fi
	echo 'egetent passwd 10 != egetent passwd root'

	if [[ "`egetent group 10`" == "`egetent group root`" ]] ; then
		echo 'ERROR! egetent group 10 == egetent group root!' 1>&2
		exit 77
	fi
	echo 'egetent group 10 != egetent group root'

	echo "Syntax OK."
	exit 0
fi
