import 'dart:convert';

sglagivanie() {
  var object = {
    'a': {
      'b': {'c': 1, 'd': 2},
      'e': 3
    },
    'f': 4
  };
  var d = jsonDecode(jsonEncode(object));
  var f = function(d);
  print('teg $f');
  f.forEach((k, v) {});
}

Map function(Map d, [int i = 0]) {
  Map m = {};
  i++;
  for (var keysB in d.keys) {
    if (d[keysB] is Map<String, dynamic>) {
      for (var keysM in d[keysB].keys) {
        m.addEntries([MapEntry('$keysB.$keysM', d[keysB][keysM])]);
      }
    } else {
      m.addEntries([MapEntry('$keysB', d[keysB])]);
    }
  }
  try {
    if (m.entries.every((element) => element.value is int)) {
      return m;
    }
    return function(m, i);
  } catch (e) {
    return function(m, i);
  }
}
