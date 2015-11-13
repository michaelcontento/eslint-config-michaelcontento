# !/usr/bin/env bash
set -e

NODE_VERSION=$(node --version | cut -c2)
if [ "${NODE_VERSION}" == "5" ]; then
    echo ">> npm install peerDependencies as we're node v.5"
    npm install --ignore-scripts \
        babel-eslint \
        eslint-config-airbnb \
        eslint-plugin-mocha-only \
        > /dev/null
fi

echo ">> npm install eslint"
npm install --ignore-scripts eslint > /dev/null

echo ">> linking eslint-config-michaelcontento"
ln -sf $(pwd) node_modules/eslint-config-michaelcontento

echo ">> running eslint"
./node_modules/.bin/eslint tests/
