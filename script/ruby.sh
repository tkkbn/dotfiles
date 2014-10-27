#!/usr/bin/env bash

VERSION="2.1.2"
INSTALL_OPTIONS="
  --with-readline-dir=$(brew --prefix readline)
  --with-openssl-dir=$(brew --prefix openssl)
"
DEFAULT_GEMS="
  bundler
  rebuild
"

if rbenv versions | grep $VERSION > /dev/null; then
  echo "Skip: rbenv install ${VERSION}"
else
  RUBY_CONFIGURE_OPTS="${INSTALL_OPTIONS}" rbenv install ${VERSION}
  rbenv global $VERSION
  rbenv rehash
fi

# for gem_name in $DEFAULT_GEMS; do
#   if gem list | grep $gem_name > /dev/null; then
#     echo "Skip: gem install ${gem_name}"
#   else
#     gem install $gem_name
#   fi
# done