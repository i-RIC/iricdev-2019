#!/bin/bash

# All version numbers are stored in versions.cmd
#
# This has a strange syntax and only works in
# Bash/Zsh/Ksh93
# see https://www.shellcheck.net/
# see http://mywiki.wooledge.org/BashFAQ/024

while IFS= read -r line
do
  eval "${line//set/export}"
done < <(grep '^set \(.*\)_VER=\(.*\)' versions.cmd)

# replace . with _
BOOST_UVER=${BOOST_VER//\./_}
EXPAT_UVER=${EXPAT_VER//\./_}
OPENSSL_UVER=${OPENSSL_VER//\./_}

# remove .  (Not sure if this is still used)
LIBPNG_NVER=${LIBPNG_NVER//\./}

export BOOST_UVER EXPAT_UVER OPENSSL_UVER LIBPNG_NVER

if [ -z "$BUILD_TOOLS" ]; then
  export BUILD_TOOLS="OFF"
fi
