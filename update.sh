#!/bin/bash -e
cd public/nuclear || ( echo "Directory public/nuclear not found" && exit 1)
git stash
git pull origin master  
git stash apply