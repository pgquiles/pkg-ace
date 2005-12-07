#!/bin/sh
#
# Remove reactor header files that should be distributed only with the 
# lib{ace,tao}-{fl,qt,tk,xt}reactor-dev packages.
#
# Because there are wildcards in *.install files, we need to force
# shell evaluation.

DUPS=`cat debian/libace-*reactor-dev.install debian/libtao-*resource-dev.install|grep include|cut -f 1 -d ' '|sed -e 's,^ace/,debian/libace-dev/usr/include/ace\/,g;s,^TAO/,debian/libtao-dev/usr/include/,g'`

for fname_ in $DUPS; do
    eval rm -f "$fname_"
done
