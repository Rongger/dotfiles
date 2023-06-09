#!/bin/zsh

cd .git

type=$1

if [ "$type" = "company" ]; then
    git config user.name "junrong_zhang"  
    git config user.email "junrong_zhang@yunzhijia.com"
    echo "Change to company"
else
    git config user.name "Rongger"  
    git config user.email "jrongger@gmail.com"   
    echo "Change to github"
fi

cd ..