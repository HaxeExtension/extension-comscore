#!/bin/sh

# exit script on error
set -e

echo "Removing old build products"

# remove old stuff
rm -rf ndll
rm -rf native/obj

echo "Building native libraries for OpenFL"

# generate native libraries
lime rebuild ./native ios -clean

echo "Complete!"
