#!/bin/bash
git -C public config --local user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git -C public config --local user.action "${GITHUB_ACTOR}"
git -C public rm .
hugo
git -C public add .
git -C public commit -m "Deployment for $(date +%Y%m%d-%H:%M:%s)"
git -C public push origin master
