#!/bin/bash
cat status | grep ^A | sed -e 's/A\t//g' | sed -e 's/\(.*\)\{1,\}/\1/' | sed 's,/*[^/]\+/*$,,' > paths
awk '!x[$0]++' paths > paths.new
rm paths;
echo -e "#!/bin/bash\n\nif [ \$1 == \"install\" -o \$1 == \"upgrade\" ]; then\n" > preinst
while read p; do
  echo -e "\tif [ ! -d \"/$p\" ]; then\n\t\tmkdir -p \"/$p\";\n\tfi\n" >> preinst
done < paths.new
echo -e "fi" >> preinst
rm paths.new
