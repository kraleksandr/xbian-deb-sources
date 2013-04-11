#!/bin/bash
./create_control.sh
rm $(grep "Package" control | awk '{print $2}')$(grep "Version" control | grep -o "[0-9\.]\{1,\}").deb
ar -rc $(grep "Package" control | awk '{print $2}')$(grep "Version" control | grep -o "[0-9\.]\{1,\}").deb debian-binary control.tar.gz data.tar.gz