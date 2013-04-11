#!/bin/bash
if [ -f control.tar ]; then
	rm control.tar
fi

if [ -f control.tar.gz ]; then
	rm control.tar.gz
fi

tar -cf control.tar control

tar -rf control.tar post*
tar -rf control.tar pre*
tar -rf control.tar md5sums
gzip -9 control.tar
