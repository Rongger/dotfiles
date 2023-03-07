#!/bin/zsh

# node@18
yarn add -D husky lint-staged prettier

npx husky add .husky/pre-commit 'npx lint-staged'

npm pkg set husky.hooks.pre-commit="npx lint-staged"

npm pkg set lint-staged['src/*'][0]="eslint --fix"

# 手动添加
echo 'package.json 手动添加: \n"lint-staged": {
  "src/**/*.{js?(x),ts?(x)}": [
    "eslint --fix",
    "prettier --write"
  ],
  "app/**/*.{less,css,md,json}": [
    "prettier --write"
  ]
}'
