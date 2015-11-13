module.exports = {
    "extends": [
        "eslint-config-airbnb/base"
    ],
    "parser": "babel-eslint",
    "plugins": [
        // Fail if we left a .only in our tests
        "eslint-plugin-mocha-only"
    ],
    "env": {
        // Enable all global mocha functions
        "mocha": true
    },
    "globals": {
        // Don't complain about sinon in tests
        "sinon": false,
        // Don't complain about should-BDD-style
        "should": false
    },
    "rules": {
        // We use 4 spaces as indentation
        "indent": [2, 4],

        // Ignore dangling commas
        "comma-dangle": [0, "never"],

        // Don't complain about BDD style tests
        "no-unused-expressions": [0],

        // Allow us to comment-out unused function arguments like:
        //     function fooBar(usedArg/*, unusedArg */) {}
        // NOTE: This extends airbnb/base only with new markers!
        "spaced-comment": [2, "always", {
            "markers": [
                "=", "!", // airbnb/base
                ",", "{"  // our addition
            ]
        }]
    }
};
