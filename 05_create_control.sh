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
