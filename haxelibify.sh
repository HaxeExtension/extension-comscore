#!/bin/sh

# exit script on error
set -e

# create haxelib archive
# (don't include copyrighted files)
zip -vr comscore.zip ./* -x "*.DS_Store" "*.a" "/native/iphone/include/*.h" "*.o"

# update haxelib?
