#!/bin/bash

# --------------------------------------------------
# mkrepo.sh | By g5ostXa | 2024
# --------------------------------------------------
# Run this script in the same directory where you want your repo
# Arguments: --repo=repo --repo-url=repourl --gitusername=username
# Usage example:
#   ./mkrepo.sh --repo=somerepo --repo-url=https://github.com/gitusername/somerepo.git --gitusername=gitusername

GIT_CLIENT="github"

for ARG in "$@"; do
	case $ARG in
	--repo=*)
		REPO="${ARG#*=}"
		shift
		;;
	--repo-url=*)
		REPO_URL="${ARG#*=}"
		shift
		;;
	--gitusername=*)
		GIT_USERNAME="${ARG#*=}"
		shift
		;;
	*)
		echo "Unknown argument: $ARG"
		echo "Usage: $0 --repo=repo_name --repo-url=repo_url --gitusername=git_username "
		exit 1
		;;
	esac
done

if ! command -v git >/dev/null 2>&1; then
	echo "git is not installed..."
	exit 1
fi

if [ -z "$REPO" ] || [ -z "$REPO_URL" ] || [ -z "$GIT_USERNAME" ]; then
	echo "Usage: $0 --repo=repo_name --repo-url=repo_url --gitusername=git_username "
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
