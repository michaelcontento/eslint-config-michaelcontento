# !/usr/bin/env bash
set -e

echo ">> git clone"
git clone git@github.com:michaelcontento/redux-storage.git
cd redux-storage

echo ">> npm install"
npm install --ignore-scripts > /dev/null

echo ">> npm install local eslint-config-michaelcontento"
npm install ../ > /dev/null

echo ">> make lint"
make lint

echo ">> cleanup"
cd ../
rm -rf redux-storage
