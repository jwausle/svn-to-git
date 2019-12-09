#!/bin/bash
git stash
git checkout develop
git branch -D left right
git checkout -b left
echo "left" > conflict.txt
git add .
git commit -m"Left"
git checkout develop
git checkout -b right
echo "right" > conflict.txt
git add .
git commit -m"Right”
