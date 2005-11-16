#!/bin/sh
files=`cd TAO && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE tao | sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 TAO/$i debian/libtao-dev/usr/include/`dirname $i`
done

files=`cd TAO && grep -lr defined.*ACE_TEMPLATES_REQUIRE_SOURCE orbsvcs | grep -v "examples\|tests\|performance-tests" |sed -e 's/^\.//' -e 's/.h$/.cpp/'`

for i in $files; do
  install -m 0644 TAO/$i debian/libtao-orbsvcs-dev/usr/include/`dirname $i`
done


