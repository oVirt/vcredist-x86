#!/bin/bash -xe
[[ -d exported-artifacts ]] \
|| mkdir -p exported-artifacts

[[ -d tmp.repos/SOURCES ]] \
|| mkdir -p tmp.repos/SOURCES

spectool --all --get-files --directory tmp.repos/SOURCES vcredist-x86.spec

rpmbuild \
    -D "_topdir $PWD/tmp.repos" \
    -ba vcredist-x86.spec

find \
    "$PWD/tmp.repos" \
    -iname \*.rpm \
    -exec mv {} exported-artifacts/ \;

