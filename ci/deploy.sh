#!/bin/bash
git clone https://${GITHUB_TOKEN}@github.com/ReverentEngineer/ReverentEngineer.github.io public || exit 1
cd public && git rm -r . && cd .. || exit 1
curl -L  https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz | tar -xz hugo || exit 1
./hugo || exit 1
cd public || exit 1
echo "reverentengineer.com" > CNAME
git config --local user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --local user.name "${GITHUB_ACTOR}"
git add .
git commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git push -u origin master
