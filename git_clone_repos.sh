#!/bin/bash
cd
mkdir git
cd git

git init

repos=$(curl -s "https://api.github.com/users/luiscelestino/repos?page=1&per_page=1000" | awk '/ssh_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repo in $repos
do
  git clone $repo
done
