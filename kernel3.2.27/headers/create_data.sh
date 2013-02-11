#!/bin/bash
#Create tarball
rm data.tar.gz
tar cvf data.tar
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/"\1"/' | xargs tar rvf data.tar
gzip -9 data.tar
