#!/bin/sh

LIBS_IN_INSTALL=`mktemp` || exit 1
LIBS_IN_CONTROL=`mktemp` || exit 1

CUT=/usr/bin/cut
DIFF=/usr/bin/diff
LS=/bin/ls
GREP=/bin/grep
RM=/bin/rm
SED=/bin/sed
SORT=/usr/bin/sort
WD=`dirname $0`

$LS $WD/*.install | $GREP "debian/lib" | $GREP -v -- -dev | $SED -e 's#.*debian/##' -e 's#\.install$##' | $SORT > $LIBS_IN_INSTALL
$GREP '^Package: lib.*c2a' $WD/control | $CUT -d' ' -f 2 | $SORT > $LIBS_IN_CONTROL

$DIFF -u $LIBS_IN_CONTROL $LIBS_IN_INSTALL

$RM $LIBS_IN_INSTALL $LIBS_IN_CONTROL