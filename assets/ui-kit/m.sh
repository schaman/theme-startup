#!/bin/sh
csplit -k index.html '/<!-- /' {99}
for f in xx*; do
    d="$(head -1 "$f" | awk '{print $2}').html"
    echo $d
    if [ ! -f "$d" ]; then
        mv "$f" "$d"
    else
        echo "File '$d' already exists! Skiped '$f'"
    fi
done