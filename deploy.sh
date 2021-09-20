#!/usr/bin/env sh
# abort on errors
set -e
# build
npm run build
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git add -A
git config --global user.name 'Your Name'
git config --global user.email 'your-username@users.noreply.github.com'
git commit -m 'deploy'
git push -f git@github.com:olovholm/vueapp.git main:gh-pages
cd -