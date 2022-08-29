#!/bin/bash

# Utilize VCS's diff function to make sure that
# the hsfiles have no diff.

rm -rf simple.hsfiles

stack-templatizer simple
