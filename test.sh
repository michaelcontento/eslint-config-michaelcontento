# !/usr/bin/env bash
set -e

npmInstall() {
    local name=$1
    if [ ! -d node_modules/$name ]; then
        echo ">> npm install $name"
        npm install --ignore-scripts $name > /dev/null
    fi
}

NODE_VERSION=$(node --version | cut -c1-2)
if [ "${NODE_VERSION}" = "v5" ]; then
    echo ">> ensuring peerDependencies as we're node v.5"
    npmInstall eslint-plugin-mocha-only
fi

npmInstall eslint

echo ">> linking eslint-config-michaelcontento"
rm -rf node_modules/eslint-config-michaelcontento
ln -sf $(pwd) node_modules/eslint-config-michaelcontento

echo ">> running eslint"
./node_modules/.bin/eslint tests/
