#!/usr/bin/env bash
set -e

link() {
    local name=$1
    if [ ! -f $(pwd)/../$name/package.json ]; then
        rm -rf $(pwd)/../$name
        ln -sf $(pwd)/node_modules/$name ../
    fi
}

link babel-eslint
link eslint-config-airbnb
link eslint-plugin-mocha-only
