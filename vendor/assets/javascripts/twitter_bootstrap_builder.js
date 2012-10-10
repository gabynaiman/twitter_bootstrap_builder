String.prototype.startsWith = function (prefix, ignoreCase) {
    var _prefix = prefix.source ? prefix.source : prefix.escapeRegExp();
    return this.match(new RegExp("^" + _prefix, ignoreCase ? 'i' : ''));
};

String.prototype.endsWith = function (suffix, ignoreCase) {
    var _suffix = suffix.source ? suffix.source : suffix.escapeRegExp();
    return this.match(new RegExp(_suffix + "$", ignoreCase ? 'i' : ''));
};

String.prototype.escapeRegExp = function() {
    return this.replace(/[-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
};

String.prototype.toRegExp = function(options) {
    return new RegExp(this.escapeRegExp(), options);
};

Array.prototype.uniq = function () {
    return this.filter(function (itm, i, a) {
        return i == a.indexOf(itm);
    });
};