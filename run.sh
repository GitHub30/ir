#!/usr/bin/env bash

# https://qiita.com/soramugi/items/13b5ea67d13ff0623737
function sum_num {
if [ -p /dev/stdin ]; then
  args=$(cat -)
else
  args=$*
fi

_num=0
for i in $args; do
  _num=$((_num+$i))
done
echo $_num
}

for url in $(python main.py https://cimtops-support.com/i-Reporter/ja/dl-docs); do wget "$url"; done
pages=$(for file in $(ls *.pdf); do pdfinfo $file | grep Pages | awk '{print $2}'; done)
rm *.pdf*

for url in $(python main.py https://cimtops-support.com/i-Reporter/ja/dl-docs-dev); do wget "$url"; done
dev_pages=$(for file in $(ls *.pdf); do pdfinfo $file | grep Pages | awk '{print $2}'; done)
rm *.pdf*

sum_num $pages
sum_num $dev_pages
