#!/bin/sh
REPODIR=${REPODIR:-${HOME}/svn/glep0027/trunk}
MODULES=${MODULES:-}
WORKDIR=${WORKDIR:-.}
DISTDIR=`pwd`
MAKEOPTS=${MAKEOPTS:-"-j1"}

cd ${WORKDIR}

if [[ -z "${MODULES}" ]] ; then
	echo ">>> Building list of dynusers modules: "
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
	cd ${i}
	cp -r ${REPODIR}/${i}/* .
	find -type d -name .svn |xargs rm -rf
	cd -
done

echo ">>> Running ./autogen.bash..."
for i in ${MODULES} ; do
	test -f ${i}/autogen.bash || continue
	echo "  + ${i}"
	cd ${i}
	./autogen.bash || exit ${?}
	cd -
done

echo ">>> Running ./configure..."
for i in ${MODULES} ; do
	test -f ${i}/configure || continue
	echo "  + ${i}"
	cd ${i}
	./configure || exit ${?}
	cd -
done

echo ">>> Running make..."
for i in ${MODULES} ; do
	test -f ${i}/Makefile || continue
	echo "  + ${i}"
	cd ${i}
	make ${MAKEOPTS} || exit ${?}
	cd -
done

echo ">>> Running make distcheck..."
for i in ${MODULES} ; do
	test -f ${i}/Makefile || continue
	echo "  + ${i}"
	cd ${i}
	make ${MAKEOPTS} distcheck || exit ${?}
	cd -
done

echo "All tests succeeded! :)"

echo ">>> Copying all distfiles to ${DISTDIR}..."
for i in ${MODULES} ; do
	cd ${i}
	cp -v ${i}-*.tar.bz2 ${DISTDIR}
	cd -
done
# vim: ts=4 :
