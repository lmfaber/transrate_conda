#!/bin/bash

set -e -o pipefail

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

mkdir -p $outdir
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/bin

rm -f bin/librt.so.1
cp -r bin $outdir
cp -r lib $outdir
cp transrate $outdir

ln -s $PREFIX/share/transrate-1.0.3-0/transrate $PREFIX/bin/transrate

# Install missing dependencies
transrate --install-deps ref
