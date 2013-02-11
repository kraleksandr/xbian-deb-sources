#!/bin/bash
#Generate md5 checksums
rm md5sums
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/"\1"/' | xargs md5sum > md5sums
sed -i 's/\t\///g' md5sums;