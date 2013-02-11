#!/bin/bash
./create_control.sh
rm xbian-package-headers3.2.27-1.0.deb
ar -rc xbian-package-headers3.2.27-1.0.deb debian-binary control.tar.gz data.tar.gz
