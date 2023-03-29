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

# We get the version and tag from inputs
export VERSION=$2
export TAG=$3

# Clone repos
git clone https://github.com/guardian/mobile-apps-api-models.git
git clone https://github.com/guardian/mapi-models-swift.git

# Generating the swift models is part of the release flow
# We should only be releasing after merging to the main branch
echo "Generating Swift models..."
thrift --gen swift -r mobile-apps-api-models/models/src/main/thrift/collection.thrift

# Hopefully -f is a first-time-only thing
rm -f mapi-models-swift/Sources/Blueprint/*.swift
cp gen-swift/* mapi-models-swift/Sources/Blueprint

# Commit and tag latest swift models
cd mapi-models-swift
git add Sources/Blueprint/*.swift

# --allow-empty because we don't want to fail if model is exactly the same (?)
git commit --allow-empty -m "Update swift models based on https://github.com/guardian/mobile-apps-api-models/releases/tag/$TAG"
git tag $VERSION

# Push the commit and tag
git push -u origin HEAD
git push --tags

echo "Finished!"