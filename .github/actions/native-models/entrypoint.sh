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

# We get the version from an input
export VERSION=$2

# Clone repos
git clone https://github.com/guardian/mobile-apps-api-models.git
git clone https://github.com/guardian/mapi-models-swift.git

# for swift package let's assume that we only build from main
# We will generate a new commit on the target branch
#echo "Checking out branch: $BRANCH"
cd mapi-models-swift
git checkout -b test-workflow
cd ..

# Generate Swift (output will be in gen-swift folder)
echo "Generating Swift code for version $VERSION..."
thrift --gen swift -r mobile-apps-api-models/models/src/main/thrift/collection.thrift

# Hopefully -f is a first-time-only thing
rm -f mapi-models-swift/Sources/Collection/*.swift
cp gen-swift/* mapi-models-swift/Sources/Collection

# Commit and tag latest swift models
cd mapi-models-swift
git add Sources/Collection/*.swift

# --allow-empty because we don't want to fail if model is exactly the same (?)
git commit --allow-empty -m "Update swift models based on https://github.com/guardian/mobile-apps-api-models/releases/tag/$VERSION"

#git tag $VERSION

# Push the changes (and tags)
git push -u origin HEAD
#git push --tags

echo "Finished!"