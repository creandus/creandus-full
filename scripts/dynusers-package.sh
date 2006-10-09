#!/bin/sh
REPODIR=${REPODIR:-${HOME}/svn/creandus/trunk}
MODULES=${MODULES:-}
WORKDIR=${WORKDIR:-$(readlink -f .)}
DISTDIR=`pwd`
MAKEOPTS=${MAKEOPTS:-"-j1"}

pushd ${WORKDIR}

if [[ -z "${MODULES}" ]] ; then
	echo ">>> Building list of creandus modules: "
	for i in `/bin/ls -d ${REPODIR}/*/` ; do
		if [[ -d ${i} ]] ; then
			i=`basename ${i/\/}`
			echo "  + ${i}"
			MODULES="${MODULES} ${i}"
		fi
	done
fi

echo ">>> Removing old trees..."
for x in ${MODULES} ; do
	if [[ -e "${x}" ]] ; then
		chmod -R u+w ${x}
		rm -rf ${x}
	fi
done

echo ">>> Copying current tree..."
mkdir ${MODULES}
for i in ${MODULES} ; do
	echo "  + ${i}"
	pushd ${i} >/dev/null
	cp -r ${REPODIR}/${i}/* .
	find -type d -name .svn |xargs rm -rf
	popd >/dev/null
done

echo ">>> Running ./autogen.bash..."
for i in ${MODULES} ; do
	test -f ${i}/autogen.bash || continue
	echo "  + ${i}"
	pushd ${i} >/dev/null
	./autogen.bash || exit ${?}
	popd >/dev/null
done

echo ">>> Running ./configure..."
for i in ${MODULES} ; do
	test -f ${i}/configure || continue
	echo "  + ${i}"
	pushd ${i} >/dev/null
	./configure || exit ${?}
	popd >/dev/null
done

echo ">>> Running make..."
for i in ${MODULES} ; do
	test -f ${i}/Makefile || continue
	echo "  + ${i}"
	pushd ${i} >/dev/null
	make ${MAKEOPTS} || exit ${?}
	popd >/dev/null
done

echo ">>> Running make distcheck..."
for i in ${MODULES} ; do
	test -f ${i}/Makefile || continue
	echo "  + ${i}"
	pushd ${i} >/dev/null
	make ${MAKEOPTS} distcheck || exit ${?}
	popd >/dev/null
done

echo "All tests succeeded! :)"

echo ">>> Copying all distfiles to ${DISTDIR}..."
for i in ${MODULES} ; do
	pushd ${i} >/dev/null
	cp -v ${i}-*.tar.bz2 ${DISTDIR}
	popd >/dev/null
done
# vim: ts=4 :
