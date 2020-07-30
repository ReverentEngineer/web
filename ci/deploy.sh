#!/bin/bash
cd public && git rm . && cd ..
hugo
cd public
git config --local user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --local user.action "${GITHUB_ACTOR}"
git add .
git commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git push origin master
