#!/bin/sh
# Copy the template sources as well

set -e

test -n "$ACE_ROOT"

#####################
# libace-dev package
files=`cd "$ACE_ROOT" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE ace | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/$i" debian/libace-dev/usr/include/`dirname $i`
done

rm debian/libace-dev/usr/include/ace/RMCast

#####################
# libace-rmcast-dev
files=`cd "$ACE_ROOT" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE ace/RMCast | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/$i" debian/libace-rmcast-dev/usr/include/$i
done

#####################
# libtao-dev
files=`cd "$ACE_ROOT/TAO" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE tao | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/TAO/$i" debian/libtao-dev/usr/include/`dirname $i`
done

#####################
# libtao-orbsvcs-dev
files=`cd "$ACE_ROOT/TAO" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE orbsvcs | grep -v "examples\|tests\|performance-tests" |sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/TAO/$i" debian/libtao-orbsvcs-dev/usr/include/`dirname $i`
done

#####################
# libkokyu-dev
files=`cd "$ACE_ROOT" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE Kokyu | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/$i" debian/libkokyu-dev/usr/include/`dirname $i`
done

#####################
# libciao-dev
files=`cd "$ACE_ROOT/TAO/CIAO" && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE ciao | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 "$ACE_ROOT/TAO/CIAO/$i" debian/libciao-dev/usr/include/`dirname $i`
done
