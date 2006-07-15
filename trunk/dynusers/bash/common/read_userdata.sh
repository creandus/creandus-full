# read_userdata.sh - Read the proper data file for the desired user
# $Id$

# In the full implementation, should go through all the cascading
# profiles in proper order, but for now we're just parsing these 2
# config files

# TODO: Build USERFILE dynamically based upon the currently selected profile.
# Work from the profile up to its parents, etc, to build this list.

# TODO: Split this file up in such a way as to be automatically done
# correctly for various distros.

USERFILE="${DATADIR}/user/${NEWUSER} ${DATADIR}/accounts"

for i in ${USERFILE}; do
	userid_=$(grep ^uid: ${i} |cut -d: -f2)
	userid_=${userid_## }
	userid=${userid:-${userid_}}

	usershell_=$(grep ^shell: "${i}" |cut -d: -f2)
	usershell_=${usershell_## }
	usershell=${usershell:-${usershell_}}

	userhome_=$(grep ^home: "${i}" |cut -d: -f2)
	userhome_=${userhome_## }
	userhome=${userhome:-${userhome_}}

	usergroups_=$(grep ^groups: "${i}" |cut -d: -f2)
	usergroups_=${usergroups_## }
	usergroups=${usergroups:-${usergroups_}}

	usercomment_=$(grep ^comment: "${i}" |cut -d: -f2)
	usercomment_=${usercomment_## }
	usercomment=${usercomment:-${usercomment_}}

	unset userid_ usershell_ userhome_ usergroups_ usercomment_
done