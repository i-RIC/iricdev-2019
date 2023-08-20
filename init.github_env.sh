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
  echo "${line//set /}"
done < <(grep '^set \(.*\)_VER=\(.*\)' versions.cmd)

# # replace . with _
BOOST_UVER=${BOOST_VER//\./_}
EXPAT_UVER=${EXPAT_VER//\./_}
OPENSSL_UVER=${OPENSSL_VER//\./_}

export BOOST_UVER EXPAT_UVER OPENSSL_UVER LIBPNG_NVER
echo "BOOST_UVER=${BOOST_UVER}"
echo "EXPAT_UVER=${EXPAT_UVER}"
echo "OPENSSL_UVER=${OPENSSL_UVER}"
