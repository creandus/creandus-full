# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# auth/compat.sh - "compat" backend functions
#
# $Id$

# This expects ${groupid} and ${NEWGROUP} to be set properly
groupadd -g "${groupid}" "${NEWGROUP}"
