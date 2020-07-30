#!/bin/bash
cd public && git rm . && cd ..
curl -L  https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz | tar -x hugo
hugo
cd public
git config --local user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --local user.action "${GITHUB_ACTOR}"
git add .
git commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git push origin master
