#!/bin/sh

replace_in_file() {
  sed -e 's/-version-number @TAO_MAJOR@:@TAO_MINOR@:@TAO_BETA@/-release @TAO_VERSION_NAME@/g' < "$1" > "$1.new"
  mv "$1.new" "$1"
}

for i in "$@" ; do
  replace_in_file "$i"
done
