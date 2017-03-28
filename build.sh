#!/bin/bash
ORG=mxcl
REPO=PromiseKit
TAG=4.1.8

ORG=$1
REPO=$2
TAG=$3

rm -rf Checkout
rm *.framework.zip

if [ -z $ORG ]; then
  echo "Missing org. Usage: ./build.sh <org> <repo> <tag>";
  exit
fi

if [ -z $REPO ]; then
  echo "Missing repo. Usage: ./build.sh <org> <repo> <tag>";
  exit
fi

mkdir Checkout
cd Checkout
git clone https://github.com/$ORG/$REPO
cd $REPO

if [ -z $TAG ]; then
  echo "no tag found: building for master";
else
  echo "building tag: $TAG";
  git checkout $TAG
fi

carthage build --no-skip-current --platform iOS
carthage archive $REPO
mv $REPO.framework.zip ../..
