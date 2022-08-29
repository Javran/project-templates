#!/bin/bash

# Assume to be running under project home.
project_home=$(pwd)

pushd /tmp >/dev/null

project_name=$(mktemp -d hs-XXXXXXXX)
rm -r "/tmp/$project_name"

stack new "$project_name" "$project_home/simple.hsfiles"
cd "$project_name"

stack build && stack test && stack exec -- demo

result=$?

popd >/dev/null

rm -rf "/tmp/$project_name"

exit "$result"
