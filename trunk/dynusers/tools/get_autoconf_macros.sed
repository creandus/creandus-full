#!/bin/sed -f
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Returns a list of @foo@-like variables in the given file(s).
#
# $Id: $
 
/@[[:alnum:]]*@/!d
s//\
&\
/
s/.*\n\(.*\)\n.*/\1/
s/@//g