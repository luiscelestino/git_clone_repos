#!/bin/bash
cd
mkdir git
cd git

git init

repos=$(curl -s "https://api.github.com/users/luiscelestino/repos" | awk '/ssh_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repo in repos
do
  git clone $repo
done
