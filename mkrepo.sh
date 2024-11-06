#!/bin/bash

# --------------------------------------------------
# mkrepo.sh | By g5ostXa | 2024
# --------------------------------------------------

# Run this script in the same directory you want your repo
# with the REPO, REPO_URL and GIT_USERNAME as arguments.

# Do not run as root.

# (e.g):
# cd ~/path/to/your-repos-dir/ && source ~/path/to/mkrepo.sh "somerepo" "https://github.com/gitusername/somerepo.git" "gitusername"

REPO="$1"
REPO_URL="$2"
GIT_USERNAME="$3"
GIT_CLIENT="github"

if ! command -v git >/dev/null 2>&1; then
	echo "git is not installed..."
	exit 1
fi

set -e

mkdir "$REPO"
cd "$REPO"

git init
git branch -M main

touch README.md
echo "$REPO" >>README.md

git add .
git commit -S -m "initial"
git remote add origin "$REPO_URL"
git push --set-upstream git@"$GIT_CLIENT".com:"$GIT_USERNAME"/"$REPO".git
