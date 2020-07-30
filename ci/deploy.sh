#!/bin/bash
DEPLOY_DIR=${GITHUB_WORKSPACE}/../public
SOURCE_DIR=${GITHUB_WORKSPACE}
cd $DEPLOY_DIR && git rm . && cd $SOURCE_DIR
curl -L  https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz | tar -xz hugo || exit 1
hugo -d $DEPLOY_DIR || exit 1
cd $DEPLOY_DIR || exit 1
git config --local user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --local user.name "${GITHUB_ACTOR}"
git add .
git commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git push -u origin master
