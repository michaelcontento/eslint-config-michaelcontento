#!/usr/bin/env bash
set -e

link() {
    local name=$1

    if [ ! -d $(pwd)/../../node_modules ]; then
        echo "> No parent node_modules/ folder found - skipping"
        return
    fi

    if [ -f $(pwd)/../$name/package.json ]; then
        echo "> $name already installed"
    else
        rm -rf $(pwd)/../$name
        ln -sf $(pwd)/node_modules/$name ../
    fi
}

link babel-eslint
link eslint-config-airbnb
link eslint-plugin-mocha-only
