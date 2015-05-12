#!/bin/sh

# exit script on error
set -e

# rebuild extension
sh rebuild.sh

# build for legacy code
lime test ./test/Project.xml ios -clean -verbose -Dlegacy

# build for new codebase
lime test ./test/Project.xml ios -clean -verbose
