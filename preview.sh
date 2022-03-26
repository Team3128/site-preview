#!/usr/bin/env bash

#jekyll build
#pushd _site
#rsync -ra --progress --delete . a2:public_html/team3128-preview
#popd

JEKYLL_URL=preview.team3128.org jekyll build
( #subshell
  cd _site || exit
  git init . -b gh-pages
  git remote add preview git@github.com:Team3128/site-preview.git
  git pull --set-upstream preview gh-pages
  git add .
  git commit -m "Site Preview"
  git push preview gh-pages
)
