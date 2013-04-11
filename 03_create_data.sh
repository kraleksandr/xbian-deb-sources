#!/bin/bash
if [ -f data.tar ]; then
	rm data.tar
fi
if [ -f data.tar.gz ]; then
	rm data.tar.gz
fi
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/"\1"/' | xargs tar rvf data.tar
echo $(($(ls -Al data.tar | awk '{print $5}')/1024));
sed -i "s/Installed-Size:\(.*\)/Installed-Size: $(($(ls -Al data.tar | awk '{print $5}')/1024))/" control
gzip -9 data.tar