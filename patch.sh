#!/usr/bin/env bash

scripthome="$( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"
builddir=$HOME/build
pkgdir=$HOME/build/linux
pkgbuild=$pkgdir/PKGBUILD

# Prepare directory

if [ ! -e $builddir ] ; then
  echo "Creating $builddir"
  mkdir -p $builddir
fi

# Update source

asp update linux
cd $builddir
asp -f export linux

# Add patch file

cp $scripthome/agesa-workaround.patch $pkgdir

# Update the PKGBUILD

sed -i '/^pkgbase=linux$/s/$/-custom/' $pkgbuild

awk -i inplace '
  /^source=/, /\)$/ {
    if ($1 == ")") {
      print "  agesa-workaround.patch"
    }
    print
    next
  }
  { print }
' $pkgbuild

cd $pkgdir
updpkgsums

# Done

echo "Patch applied. Package is ready to be built and installed."

