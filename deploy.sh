#!/usr/bin/env sh

# Abort on errors
set -e
# Build
npm run docs:build
# Navigate into the build output directory
cd docs/.vitepress/dist
# Init a "dist" repo
git init
git add -A
git commit -m 'deploy'
# Deploy to https://Greybeard-Entertainment.github.io
git push -f git@github.com:Greybeard-Entertainment/Greybeard-Entertainment.github.io.git main
# Return to the project root
cd -