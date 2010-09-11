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

case "$IN" in
 TAO/*)
    VERSION="$PKGCONFIG_TV"
    ;;
 *)
    VERSION="$PKGCONFIG_AV"
    ;;
esac


cat "$1" | sed -e 's#@prefix@#/usr#g' \
               -e 's#@exec_prefix@#$\{prefix\}#g' \
               -e 's#@libdir@#$\{exec_prefix\}/lib#g' \
               -e "s#@includedir@#$INCDIR#g" \
               -e "s#@VERSION@#$VERSION#g" \
               -e "s#@LIBS@##g"
