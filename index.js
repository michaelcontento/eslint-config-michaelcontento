var merge = require('merge').recursive;

function resolveExtends(rule) {
    while (rule.extends.length > 0) {
        var subRuleName = rule.extends.shift();

        var subRule = require(subRuleName);
        var newRules = subRule.extends || [];

        rule.extends = newRules.concat(rule.extends);
        delete subRule.extends;

        merge(rule, subRule);
    }

    return rule;
}

module.exports = resolveExtends({
    "extends": [
        "eslint-config-airbnb/base",
        "./rules"
    ]
});
