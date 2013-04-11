HOWTO
=====================
1) Create a new folder in which you want to create the package.<br />
2) Download the *.sh files and put them in your folder.<br />
3) Copy all files and directory needed by the package and put it in your folder.<br />
4) Run the `01_create_status.sh` script to create the `status` file.<br />
5) Run the `02_create_paths.sh` to create the `preinst` file.<br />
6) Run the `03_create_md5.sh` to create the `md5sums` file.<br />
7) Now create the following files (check other sources for inspiration):<br />
<br />
__control__

```
Origin: XBian
Package: xbian-package-test
Version: 1.0
Section: net
Priority: optional
Codename: wheezy
Architecture: armhf
Installed-Size: 1024
Maintainer: CurlyMo
Description: Test package
```
<br />
1. Change the package name<br />
2. Change the description<br />
2. Make yourself the maintainer<br />
4. Set the right version<br />
5. Add a `Depends:` field if the package depends on the existance of other packages<br />
<br />
__postinst__

```
#!/bin/bash

if [ $1 == "configure" ]; then

fi
```

Add all logic needed to configure the package inside this condition.
<br /><br />
__postrm__

```
#!/bin/bash

if [ $1 == "remove" ] || [ $1 == "purge" ]; then

fi
```

Add all logic to `completely` remove a package from the system. 
<br /><br />
__prerm__

```
#!/bin/bash
```

This file can probably stay empty like this
<br /><br />
__debian-binary__

```
2.0
```

This is the only content of this file<br /><br />
8) Run the `04_create_data.sh` script to create the `data.tar.gz` file.<br />
9) Run the `05_create_control.sh` script to create the `control.tar.gz` file.<br />
10) Run the `06_create_deb.sh` to create the final `xbian-package-test1.0.deb` file.<br />
11) Test the package on your local machine to make sure it works `dpkg -i xbian-package-test1.0.deb` to install, and `dpkg -r xbian-package-test` to remove it.<br />
