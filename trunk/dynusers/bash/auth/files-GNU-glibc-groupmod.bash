# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# auth/files.sh - "files" backend functions
#
# $Id$

# Expects a valid groupid to have already been determined
groupmod -g "${groupid}" "${NEWGROUP}"
