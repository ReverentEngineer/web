#!/bin/bash
rm -rf public
git clone https://github.com/ReverentEngineer/ReverentEngineer.github.io public
cd public && git rm -r . && cd .. || exit 1
if [[ ! -x ./hugo ]]; then
  if [[ $(uname) == "Darwin" ]]; then
    export OS="macOS";
  elif [[ $(uname) == "Linux" ]]; then
    export OS="Linux";
  else
    echo "Error. OS not recognized."
  fi
  curl -L  https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_$OS-64bit.tar.gz | tar -xz hugo || exit 1
fi
./hugo || exit 1
cd public || exit 1
echo "reverentengineer.com" > CNAME
git add .
git commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git push 
