#!/bin/bash
#
#Copyright 2013 CurlyMo <development@xbian.org>
#
#This file is part of XBian - XBMC on the Raspberry Pi.
#
#XBian is free software: you can redistribute it and/or modify it under the
#terms of the GNU General Public License as published by the Free Software
#Foundation, either version 3 of the License, or (at your option) any later
#version.
#
#XBian is distributed in the hope that it will be useful, but WITHOUT ANY
#WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
#details.
#
#You should have received a copy of the GNU General Public License along
#with XBian. If not, see <http://www.gnu.org/licenses/>
#
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/\1/' | sed 's,/*[^/]\+/*$,,' > paths
awk '!x[$0]++' paths > paths.new
rm paths;
echo -e "#!/bin/bash\n\nif [ \$1 == \"install\" -o \$1 == \"upgrade\" ]; then\n" > preinst
while read p; do
  echo -e "\tif [ ! -d \"/$p\" ]; then\n\t\tmkdir -p \"/$p\";\n\tfi\n" >> preinst
done < paths.new
echo -e "fi" >> preinst
rm paths.new
