#!/bin/sh
#
# Generates ACE+TAO pkg-config .pc files using .pc.in files.
#
# To check whether all .pc files got installed, launch from $ACE_ROOT:
#   for f in $(find -name '*.pc.in') ; do ls -l /usr/lib/pkgconfig/$(echo ${f##*/} | sed -e 's/\.in$//'); done
# and look for errors to see .pc files that were *not* installed.
#

usage() {
    cat >&2 <<EOF
$0 file.pc.in
Outputs to stdout a pkg-config .pc file from the given .pc.in.

Please define \$ACE_ROOT before launching this script
EOF
}

if test $# -ne 1; then
    usage
    exit 1
fi

if test "a$ACE_ROOT" = "a"; then
    usage
    exit 2
fi

AV=$(head -1 $ACE_ROOT/VERSION  | sed -e 's/.*version \([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/')
TV=$(head -1 $ACE_ROOT/TAO/VERSION  | sed -e 's/.*version \([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/')

#default value for includedir
INCDIR="$\{prefix\}/include"

IN="$1"

case "$IN" in
 *ACE_SSL.pc.in)
    INDIR="ace/SSL"
    ;;
 *ACE_HTBP*)
    INDIR="ace/HTBP"
    ;;
 *ACE_RMCast*)
    INDIR="ace/RMCast"
    ;;
 *ACE_TMCast*)
    INDIR="ace/TMCast"
    ;;
 *TAO_Cos*|*TAO_FT*|*TAO_RT*|*TAO_Ds*)
    INDIR="orbscvs"
    ;;
 *)
    INDIR="."
    ;;
esac

case "$IN" in
 TAO_*)
    VERSION="$TV"
    ;;
 *)
    VERSION="$AV"
    ;;
esac


cat "$1" | sed -e 's#@prefix@#/usr#g' \
               -e 's#@exec_prefix@#$\{prefix\}#g' \
               -e 's#@libdir@#$\{exec_prefix\}/lib#g' \
               -e 's#@LIBS@##g' \
               -e "s#@includedir@#$INCDIR#g" \
               -e "s#@VERSION@#$VERSION#g" \
               -e "s#@LIBS@##g"
