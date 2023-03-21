#!/bin/sh -e

# Describe dependencies (for debugging Docker)
git --version
thrift --version

# Git setup
export ACCESS_TOKEN=$1
git config --global credential.helper "/bin/bash /credential-helper.sh"
git config --global user.email '<>'

# fixes error: "fatal: detected dubious ownership in repository at '/github/workspace'"
git config --global --add safe.directory /github/workspace

# We get the branch name from an input
export BRANCH=$2

# Clone repo
git clone https://github.com/guardian/mobile-apps-api-models.git

# We will generate a new commit on the target branch
echo "Checking out branch: $BRANCH"
cd mobile-apps-api-models
git checkout $BRANCH

# Generate Swift (output will be in gen-swift folder)
echo "Generating Swift code..."
thrift --gen swift -r models/src/main/thrift/collection.thrift

# Hopefully -f is a first-time-only thing
rm -f Sources/Collection/*.swift
cp gen-swift/* Sources/Collection

git add Sources/Collection/*.swift

# --allow-empty because we don't want to fail if model is exactly the same (?)
git commit --allow-empty -m "Update swift models"

git push origin HEAD

echo "Finished!"