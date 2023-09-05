recurs() {
  var nestedArray = [
    1,
    [
      2,
      [3, 4],
      5
    ],
    6
  ];
  final f = func(nestedArray);
  print('teg $f');
}

List func(List str)  {
  bool out = true;
  for (var i = 0; i < str.length; i++) {
    if (str[i] is List) {
      print('teg element ${str[i]}');
      out = false;
      var u = str.removeAt(i);
      str.addAll(u);
    }
  }
  if (out) {
    return str;
  } else {
    print('teg list $str');
    return func(str);
  }
}
