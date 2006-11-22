#!/bin/bash
PORTDIR="${PORTDIR:-$(paludis --configuration-variable gentoo location)}"
PORTDIR="${PORTDIR:-$(portageq envvar PORTDIR)}"
PORTDIR="${PORTDIR:-/usr/portage}"

echo -n "Creating temp files: " 1>&2
# Temporary files
echo -n "." 1>&2
ebuild_list=$(mktemp -t ebuild.XXXXXX)
echo -n "." 1>&2
eclass_list=$(mktemp -t eclass.XXXXXX)
echo -n "." 1>&2
ebuild_grep_cmd=$(mktemp -t ebuild_grep_cmd.XXXXXX)
echo " done." 1>&2

pushd $PORTDIR >/dev/null

echo -n "Generating eclass list: " 1>&2

# Generate list of matching eclasses
for ec in eclass/*.eclass ; do
	# Skip this false positive
	[[ "$ec" == *eutils.eclass ]] && continue
	if grep -l -e enewuser -e enewgroup $ec >> $eclass_list ; then
		echo -n "+" 1>&2
	else
		echo -n "." 1>&2
	fi
done
echo " done." 1>&2

echo -n "Generating ebuild grep command: " 1>&2
# Build the arguments for our grep of each ebuild, so we only have to touch
# each ebuild once.
echo -n "-l -e enewuser -e enewgroup" >> $ebuild_grep_cmd
for ec in $(< $eclass_list) ; do
	ec=${ec/eclass\/}
	ec=${ec/.eclass}
	echo -n "." 1>&2
	echo -n " -einherit.\\\\*$ec" >> $ebuild_grep_cmd
done
echo >> $ebuild_grep_cmd
echo " done." 1>&2

echo -n "Generating ebuild list: " 1>&2
i=0
# Generate list of matching ebuilds
for c in $(< profiles/categories) ; do
	for e in $c/*/*.ebuild ; do
		[[ -f "${e}" ]] || continue
		i=$(( $i + 1 ))
		[[ $(( $i % 100 )) == 0 ]] && echo -n "." 1>&2
		grep $(< $ebuild_grep_cmd) $e >> $ebuild_list \
			&& echo -n "+" 1>&2
	done
done
echo " done." 1>&2

echo "Generating final list: " 1>&2
# Generate our final list
cat $eclass_list $ebuild_list
echo " done." 1>&2

popd >/dev/null
rm -f $ebuild_list $eclass_list $ebuild_grep_cmd
