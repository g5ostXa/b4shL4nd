#!/bin/bash

# --------------------------------------------------
# mkrepo.sh | By g5ostXa | 2024
# --------------------------------------------------
# Run this script in the same directory where you want your repo
# Arguments: --repo-name=NEWREPO --repo-url=REPO_URL --git-user=USERNAME --git-client=GIT_CLIENT
# Usage example:
#   ./mkrepo.sh --repo-name=NEWREPO --repo-url=https://github.com/git-user/newrepo.git --git-user=USERNAME --git-client=github

for ARG in "$@"; do
	case $ARG in
	--repo-name=*)
		REPO_NAME="${ARG#*=}"
		shift
		;;
	--repo-url=*)
		REPO_URL="${ARG#*=}"
		shift
		;;
	--git-user=*)
		GIT_USER="${ARG#*=}"
		shift
		;;
	--git-client=*)
		GIT_CLIENT="${ARG#*=}"
		shift
		;;
	*)
		echo "Unknown argument: $ARG"
		echo "Usage: $0 --repo-name=NEWREPO --repo-url=REPO_URL --git-user=USERNAME --git-client=GIT_CLIENT"
		exit 1
		;;
	esac
done

if ! command -v git >/dev/null 2>&1; then
	echo "git is not installed..."
	exit 1
fi

if [ -z "$REPO_NAME" ] || [ -z "$REPO_URL" ] || [ -z "$GIT_USER" ] || [ -z "$GIT_CLIENT" ]; then
	echo "Usage: $0 --repo-name=NEWREPO --repo-url=REPO_URL --git-user=USERNAME --git-client=GIT_CLIENT"
	exit 1
fi

set -e

mkdir "$REPO_NAME"
cd "$REPO_NAME"

git init
git branch -M main

touch README.md
echo "$REPO" >>README.md

git add .
git commit -S -m "initial"
git remote add origin "$REPO_URL"
git push --set-upstream git@"$GIT_CLIENT".com:"$GIT_USER"/"$REPO_NAME".git
