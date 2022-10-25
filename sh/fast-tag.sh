#!/bin/zsh

source ./functions/common.sh

install_if_pkg_no_exist jq

if [ ! -f "./package.json" ]; then
  echo "Error: package.json no existed."
  return
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ $current_branch != "master" ] && [ $current_branch != "main" ]; then
  echo "Error: current git branch must be master or main."
  return
fi

tmp=$(mktemp)
next_version=$1

if [ ! $next_version ]; then
  version=$(jq -r '.version' ./package.json)
  next_version=$(echo $version | awk -F. -v OFS=. '{$NF += 1 ; print}')
fi

jq --arg a "$next_version" '.version = $a' package.json >"$tmp" && mv "$tmp" package.json

echo "version: $next_version"

git add .
git commit -m "version: $next_version"

git tag $next_version
git push origin $current_branch
git push origin $next_version
