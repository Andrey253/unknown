import 'dart:convert';

preobrObjects() {
  var object = {
    'a': {
      'd': {'h': 4},
      'e': 2
    },
    'b': 1,
    'c': {
      'f': {'g': 3, 'k': {}}
    }
  };
  var d = jsonDecode(jsonEncode(object));
  var f = function(d);
  f.forEach((k, v) {
    print('teg $k   $v');
  });
}

function(dynamic d, [int level = 0]) {
  if (!d.keys.contains('level')) {
    d['level'] = level;
  }
  level++;
  d.forEach((k, value) {
    if (d[k] is Map && d[k].isEmpty) {
      d[k] = '[Object]';
    } else if (value is Map) {
      function(value, level);
    }
  });
  return d;
}
