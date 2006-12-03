#!/bin/sh

usage() {
    echo "$0 file.pc.in" >& 2
    echo "generate pkgconfig files" >& 2
}

if test $# -ne 1; then
    usage
    exit 1
fi

#default values
INCDIR="$\{prefix\}/include"

IN=$(echo "$1" | sed -e "s#^$ACE_ROOT/##")

case "$IN" in
 *ACE_SSL.pc.in)
    INDIR="ace/SSL"
    ;;
 *TAO_Utils.pc.in)
    INDIR="tao/Utils"
    ;;
 *orbsvcs/orbsvcs/TAO_*.pc.in)
    INDIR="orbsvcs"
    ;;
 *)
    INDIR=`dirname $(echo $IN | sed -e 's#^\(TAO/\|ace/\|protocols/\)##')`
    ;;
esac

case "$IN" in
 TAO/*)
    VERSION="$TV"
    ;;
 *)
    VERSION="$AV"
    ;;
esac

if test "s$INDIR" != "s." ; then
    INCDIR="$INCDIR/$INDIR"
fi

cat "$1" | sed -e 's#@prefix@#/usr#g' \
               -e 's#@exec_prefix@#$\{prefix\}#g' \
               -e 's#@libdir@#$\{exec_prefix\}/lib#g' \
               -e "s#@includedir@#$INCDIR#g" \
               -e "s#@VERSION@#$VERSION#g"
