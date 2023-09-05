import 'dart:convert';

const str = 'one.two.three.four.five';
stringToObject() {
  final list = str.split('.');

  // final j = '{' + list.join(':{') + ':\'\'' + sc(list.length);
  var j = list.reduce((value, element) {
    return value + ': {' + element ;
  });
  j = '{' + j + ': \'\'}' + sc(list.length);
  final res = jsonEncode(j);
  jsonDecode(res);
  print('teg ${jsonDecode(res)}');
}

String sc(int length) {
  String s = '';
  for (int i = 0; i < length; i++) {
    s += '}';
  }
  return s;
}
