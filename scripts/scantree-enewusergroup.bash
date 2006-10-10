#!/bin/bash
PORTDIR="${PORTDIR:-$(paludis --configuration-variable gentoo location)}"
PORTDIR="${PORTDIR:-$(portageq envvar PORTDIR)}"
PORTDIR="${PORTDIR:-/usr/portage}"

echo "Creating temp files:" 1>&2

# Temporary files
ebuild_list=$(mktemp -t ebuild.XXXXXX)
eclass_list=$(mktemp -t eclass.XXXXXX)
ebuild_grep_cmd=$(mktemp -t ebuild_grep_cmd.XXXXXX)

pushd $PORTDIR >/dev/null

time (
echo "Generating eclass list:" 1>&2

# Generate list of matching eclasses
for ec in eclass/*.eclass ; do
	# Skip this false positive
	[[ "$ec" == *eutils.eclass ]] && continue
	grep -e enewuser -e enewgroup $ec >/dev/null 2>&1 \
		&& echo $ec >> $eclass_list
done
)

time (
echo "Generating ebuild grep command:" 1>&2

echo -n "-e enewuser -e enewgroup" >> $ebuild_grep_cmd
for ec in $(< $eclass_list) ; do
	ec=${ec/eclass\/}
	ec=${ec/.eclass}
	echo -n " -einherit.\\\\*$ec" >> $ebuild_grep_cmd
done
echo >> $ebuild_grep_cmd
)

time (
echo "Generating ebuild list:" 1>&2

# Generate list of matching ebuilds
for c in $(< profiles/categories) ; do
	for e in $c/*/*.ebuild ; do
		grep $(< $ebuild_grep_cmd) $e >/dev/null 2>&1 \
			&& echo $e >> $ebuild_list
	done
done
)

time (
echo "Generating final list:" 1>&2

# Generate our final list
cat $ebuild_list |sort -u
)

popd >/dev/null
rm -f $ebuild_list $eclass_list $ebuild_grep_cmd
