#!/bin/bash
#
# adduser.sh - intelligently adds a new user for the system package
# manager.
#
# $Id$

# Load the basic configuration.
# TODO: Fix this path with autotools.
. common/config.sh

# Read the command line arguments.

# The only options recognized now are the user to be added, the 
# package which is asking for the adding, and the userspace type (e.g. 
# GNU, fbsd, etc)
NEWUSER="${1}"
PKGNAME="${2}"
USERSPACE="${3}"

if [[ -z "${3}" || -z "${2}" || -z "${1}" ]] ; then
	echo "Script expects 3 arguments: username pkgname userspace" >&2
	exit 1
fi

# Set our default action. Will be either "add" or "mod" by the end.
ACTION="add"

###

# Read the proper data file for the desired user
# TODO: Fix this path with autotools.
. common/read_userdata.sh

# Determine a free uid
# We make use of egetent:
# TODO: Fix this path with autotools.
. common/getent.sh

# TODO: allow for more sophisticated range specifications
uidmin=${userid%-*}
uidmax=${userid#*-}

userid=${usermin}
for i in $( seq ${userid} ${uidmax} ) ; do
	[[ -z $(egetent passwd ${i}) ]] && userid=${i} && break
done

# Now, we verify this information against our database, and if there
# isn't a match (either some value has changed, or there is no entry
# at all), we take appropriate action

# See if the user already exists
if [[ ${NEWUSER} == $(egetent passwd "${NEWUSER}" | cut -d: -f1) ]] ;
then
	# TODO: If there needs to be some change made, note it
	# properly, for the user to take care of later with
	# the eselect tool
	getentinfo=$(egetent passwd "${NEWUSER}")
	
	curruid=$(echo ${getentinfo} | cut -d: -f3)
	currshell=$(echo ${getentinfo} |cut -d: -f7)
	currhome=$(echo ${getentinfo} |cut -d: -f6)
	# TODO: Check that the user is in all the proper groups here
	currcomment=$(echo ${getentinfo} |cut -d: -f5)
	if [[ ${curruid} -ne ${userid} || "${currshell}" != "${usershell}"
		|| "${currhome}" != "${userhome}"
		|| "${currcomment}" != "${usercomment}" ]] ; then
		echo "The user ${NEWUSER} needs some values changed."
		echo "We're doing so now."
		ACTION="mod"
	else
		# Now, since we've made the proper arrangements for any 
		# possible changes, we now add the current package name 
		# to the database and call it quits
		echo -n "We already have a user named ${NEWUSER}." >&2
		echo " Nothing to do." >&2

		echo "${PKGNAME}" >> "${DBDIR}/users/${NEWUSER}"
		exit 0
	fi
fi

if [[ -f "${DBDIR}/users/${NEWUSER}" ]] ; then
	echo "User ${NEWUSER} was previously added by this script," >&2
	echo "but it no longer exists on the system. We'll re-add" >&2
	echo "them now, but you should have used the users-config" >&2
	echo "tool to cleanly remove them." >&2
	echo >&2
fi

# Finally, we take take the necessary action, either via usermod 
# or useradd [or it's comparable friends]
for i in ${PASSWD_BACKENDS}; do
	# TODO: Fix this path with autotools.
	if [[ -e "auth/${i}-${USERSPACE}-user${ACTION}.sh" ]] ; then
		echo "Running ${i}-${USERSPACE}-user${ACTION}..."
		. "auth/${i}-${USERSPACE}-user${ACTION}.sh"
	else
		echo -n "Auth backend ${i} with " >&2
		echo -n "userspace ${USERSPACE} " >&2
		echo "not supported by this script." >&2
	fi
done

# Properly update the dynamic users database
echo "${PKGNAME}" >> "${DBDIR}/users/${NEWUSER}"
