#!/bin/bash

mkdir checkout
cd checkout
git clone https://github.com/mxcl/PromiseKit
cd PromiseKit
carthage build --no-skip-current --platform iOS
#produce PromiseKit.framework.zip
carthage archive PromiseKit
mv PromiseKit.framework.zip ../..
