(function() {
  var SemanticDate;

  SemanticDate = (function() {
    function SemanticDate() {}

    SemanticDate.parsers = [
      {
        match: /^(last|past)[ _\-]?minute$/i,
        func: function(now) {
          return {
            start: new Date(now - 60000),
            end: now
          };
        }
      }, {
        match: /^(last|past)[ _\-]?hour$/i,
        func: function(now) {
          return {
            start: new Date(now - 3600000),
            end: now
          };
        }
      }, {
        match: /^(last|past)[ _\-]?24(h| hours)$/i,
        func: function(now) {
          return {
            start: new Date(now - 86400000),
            end: now
          };
        }
      }, {
        match: /^yesterday$/i,
        func: function(now) {
          return {
            start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - 86400000),
            end: new Date(now.getFullYear(), now.getMonth(), now.getDate())
          };
        }
      }, {
        match: /^last[ _\-]?week$/i,
        func: function(now) {
          return {
            start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000 - 604800000),
            end: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000)
          };
        }
      }, {
        match: /^past[ _\-]?week$/i,
        func: function(now) {
          return {
            start: new Date(now - 604800000),
            end: now
          };
        }
      }, {
        match: /^last[ _\-]?month$/i,
        func: function(now) {
          var month;
          month = now.getMonth() - 1;
          if (month < 0) {
            month = 11;
          }
          return {
            start: new Date(now.getFullYear(), month, 1),
            end: new Date(now.getFullYear(), now.getMonth(), 1)
          };
        }
      }, {
        match: /^past[ _\-]?month$/i,
        func: function(now) {
          return {
            start: new Date(now - 2592000000),
            end: now
          };
        }
      }, {
        match: /^last[ _\-]?year$/i,
        func: function(now) {
          return {
            start: new Date(now.getFullYear() - 1, 0, 1),
            end: new Date(now.getFullYear(), 0, 1)
          };
        }
      }, {
        match: /^past[ _\-]?year$/i,
        func: function(now) {
          return {
            start: new Date(now - 31536000000),
            end: now
          };
        }
      }, {
        match: /^today$/i,
        func: function(now) {
          return {
            start: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
            end: now
          };
        }
      }, {
        match: /^this[ _\-]?week$/i,
        func: function(now) {
          return {
            start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000),
            end: now
          };
        }
      }, {
        match: /^this[ _\-]?month$/i,
        func: function(now) {
          return {
            start: new Date(now.getFullYear(), now.getMonth(), 1),
            end: now
          };
        }
      }, {
        match: /^this[ _\-]?year$/i,
        func: function(now) {
          return {
            start: new Date(now.getFullYear(), 0, 1),
            end: now
          };
        }
      }, {
        match: /^since[ _\-]?1970$/i,
        func: function(now) {
          return {
            start: new Date(1970, 0, 1),
            end: now
          };
        }
      }
    ];

    SemanticDate.validate = function(str) {
      var p, _i, _len, _ref;
      _ref = this.parsers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        p = _ref[_i];
        if (str.match(p.match)) {
          return true;
        }
      }
      return false;
    };

    SemanticDate.convert = function(str) {
      var now, p, _i, _len, _ref;
      now = new Date();
      _ref = this.parsers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        p = _ref[_i];
        if (str.match(p.match)) {
          return p.func(now);
        }
      }
    };

    return SemanticDate;

  })();

  if (exports) {
    module.exports = SemanticDate;
  } else if (window) {
    window.SemanticDate = SemanticDate;
  }

}).call(this);
