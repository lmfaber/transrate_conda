#!/bin/bash

set -e -o pipefail

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

mkdir -p $outdir
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/bin

# Remove problematic library
rm -f lib/librt.so.1

cp -r bin $outdir
cp -r lib $PREFIX/bin
cp transrate $outdir

# Link the programs to the bin folder
ln -s $PREFIX/share/transrate-1.0.1-0/transrate $PREFIX/bin/transrate
ln -s $PREFIX/share/transrate-1.0.1-0/bin/bam-read $PREFIX/bin/bam-read
ln -s $PREFIX/share/transrate-1.0.1-0/bin/salmon $PREFIX/bin/salmon
ln -s $PREFIX/share/transrate-1.0.1-0/bin/snap-aligner $PREFIX/bin/snap-aligner

# Install missing dependencies
transrate --install-deps ref
