#!/bin/bash
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/"\1\"/' | sed 's,/*[^/]\+/*$,",' > paths
awk '!x[$0]++' paths > paths.new
rm paths;
while read p; do
	echo -e "\tif [ ! -d $p ]; then\n\t\tmkdir -p $p;\n\tfi\n" >> paths
done < paths.new
rm paths.new
