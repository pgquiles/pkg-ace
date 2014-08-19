#!/bin/sh

set -ex

UPSTREAM_VERSION=$2
ORIG_TARBALL=$3

REAL_TARBALL=`readlink -f ${ORIG_TARBALL}`

WORKING_DIR=`dirname ${ORIG_TARBALL}`

ORIG_TARBALL_DFSG=`echo ${ORIG_TARBALL} | sed -e "s/\(${UPSTREAM_VERSION}\)\(\.orig\)/\1+dfsg\2/g"`
ORIG_TARBALL_DIR=`echo ${ORIG_TARBALL_DFSG} | sed -e "s/_\(${UPSTREAM_VERSION}\)/-\1/g" -e "s/\.tar\.gz//g"`
ORIG_TARBALL_DIR_STRIP=`basename ${ORIG_TARBALL_DIR}`

mkdir -p ${ORIG_TARBALL_DIR}
tar --directory=${ORIG_TARBALL_DIR} --strip 1 -xzf ${REAL_TARBALL} || exit 1 
rm -f ${ORIG_TARBALL} ${REAL_TARBALL}

cd ${ORIG_TARBALL_DIR}

rm -rf TAO
rm -rf ASNMP
rm -rf performance-tests
rm -rf rpmbuild debian
rm -rf websvcs
rm bin/LabVIEW_RT/*.exe
rm -rf examples/{C++NPv2,C++NPv1,APG}

GZIP=-9 tar --remove-files -czf ${ORIG_TARBALL_DFSG} ${ORIG_TARBALL_DIR} || exit 1

exit 0
